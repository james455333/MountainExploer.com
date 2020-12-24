package mountain.webCrawler;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;
import java.util.logging.Logger;

import javax.imageio.ImageIO;

import org.apache.hc.client5.http.classic.methods.HttpGet;
import org.apache.hc.client5.http.classic.methods.HttpPost;
import org.apache.hc.client5.http.entity.UrlEncodedFormEntity;
import org.apache.hc.client5.http.impl.classic.CloseableHttpClient;
import org.apache.hc.client5.http.impl.classic.CloseableHttpResponse;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.core5.http.HttpEntity;
import org.apache.hc.core5.http.NameValuePair;
import org.apache.hc.core5.http.ParseException;
import org.apache.hc.core5.http.io.entity.EntityUtils;
import org.apache.hc.core5.http.message.BasicNameValuePair;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import main.generic.model.GenericTypeObject;
import main.generic.service.InterfaceService;
import member.back.model.MemberBasicBackService;
import member.model.MemberBasic;
import mountain.MountainGlobal;
import mountain.model.activity.ActImage;
import mountain.model.activity.ActivityBasic;
import mountain.model.activity.ActivityInfo;
import mountain.model.route.MountainBean;

@Controller
public class ActCrawler {
	
	static String mainURL = "https://www.tripbaa.com/";
	private static String ImgDownloadPath = "C:\\WebCrawler\\imageTemp";
	@Autowired
	private InterfaceService<GenericTypeObject> service;
	private static int pageNo;
	@Autowired
	private MemberBasicBackService memberbasicService;
	
	@RequestMapping("/mountain/act/webCrawler/start")
	@ResponseBody
	public void StartWebCrawler(
			ActivityBasic activityBasic) {
		Logger.getLogger("StartWebCrawler").info("Start");
		pageNo = 1;
		List<MemberBasic> memberbasics = memberbasicService.selectAll();
		try (CloseableHttpClient httpclient = HttpClients.createDefault()) {
			for (int i = 1; i <= 15; i++) {
				/* 設定POST方法 */
				HttpPost httpPost = new HttpPost( mainURL + "ajax/show_search_list.php");
				/* 設定POST接受DATA */
				List<NameValuePair> params = setParams();
				/* 將DATA設置於POST內 */
				httpPost.setEntity(new UrlEncodedFormEntity(params));
				/* execute POST */
				Logger.getLogger("StartWebCrawler").info("wait for Page No." + i +  " : " +  mainURL + "ajax/show_search_list.php" );
				try(CloseableHttpResponse response = httpclient.execute(httpPost);){
					/* 得到指令回傳 */
					int code = response.getCode();
					/* 若code = 200 = success */
					if (code == 200) {
						/* 得到entity */
						HttpEntity entity = response.getEntity();
						/* 使用EntityUtils得到回傳結果 */
						String result = EntityUtils.toString(entity, "UTF-8");
						/* 使用Gson將回傳物件轉為Json */
						JsonObject jsonObject= new Gson().fromJson(result, JsonObject.class);
						JsonArray asJsonArray = jsonObject.getAsJsonArray("searchlist");
						Logger.getLogger("Save ActivityBasic").info("inject Entity :" + activityBasic + "\n");
						service.save(activityBasic);
						Logger.getLogger("Save ActivityBasic").info("pageNo :" + pageNo + "\n");
						List<ActivityBasic> actBasics = (List<ActivityBasic>) service.getwithHQL("From ActivityBasic", pageNo-1, asJsonArray.size());
						if(actBasics.size() == 0 ) break;
						for (int j = 0 ; j < asJsonArray.size() ; j++) {
							/* 得到並整理指定元素 */
							JsonElement jsonElement = asJsonArray.get(j);
							String travel_no = jsonElement.getAsJsonObject().get("travel_no").toString().replace("\"", "");
							String title = jsonElement.getAsJsonObject().get("subject").toString().replace("\"", "");
							String showPic = jsonElement.getAsJsonObject().get("showPic").toString().replace("\"", "");
							/* 下載圖片並回傳bytes */
							byte[] imgBytes = downLoadImage(showPic);
							Logger.getLogger("StartWebCrawler()").info("開始取得活動詳情 : " + mainURL + "travel/" + travel_no );
							/* 進入活動詳情頁擷取活動內容 */
							/* 設定GET方法 */
							HttpGet httpGet = new HttpGet( mainURL + "travel/" + travel_no);
							/* 設定GET接受Header */
							httpGet.addHeader("src","search");
							httpGet.addHeader("order","1");
							/* execute GET */
							try(CloseableHttpResponse response2 = httpclient.execute(httpGet)){
								/* 得到指令回傳 */
								int code2 = response2.getCode();
								/* 若code = 200 = success */
								if (code2 == 200) {
									/* 得到entity */
									HttpEntity entity2 = response2.getEntity();
									/* 使用EntityUtils得到回傳結果 */
									String html = EntityUtils.toString(entity2, "UTF-8");
									/* consume entity2 */
									EntityUtils.consume(entity2);
									
									/* 使用Jsuop 得到指定元素 */
									Document document = Jsoup.parse(html);
									Element root = document.root();
									Elements div = root.select("div#aboutStroke");
									String text = div.text();
									System.out.println("text : " + text);
									
									int randomNum = 0;
									while(true) {
										randomNum = (int) Math.round(Math.random()*memberbasics.size());
										if (randomNum < memberbasics.size()) {
											break;
										}
									}
									MemberBasic memberBasic = memberbasics.get(randomNum);
									ActivityBasic activityBasicUpdate = actBasics.get(j);
									
									activityBasicUpdate.setMemberBasic(memberBasic);
									ActivityInfo actInfoUpdate = activityBasicUpdate.getActInfo();
									actInfoUpdate.setNote(text.getBytes(MountainGlobal.CHARSET));
									actInfoUpdate.setTitle(title);
									service.update(activityBasicUpdate);
									ActImage actImage = new ActImage();
									actImage.setActivityBasic(activityBasicUpdate);
									actImage.setDefaultImage(1);
									actImage.setImg(imgBytes);
									actImage.setName(showPic);
									service.save(actImage);
									service.insert(actImage);
								}
							}catch (Exception e) {
								e.printStackTrace();
							}finally {
								Logger.getLogger("StartWebCrawler()").info("取得活動詳情結束");
							}
							CompletableFuture<String> completableFuture = CompletableFuture.supplyAsync(() -> {
								Logger.getLogger("moreInfo").info("Asncy Start");
								return "complete";
							}).whenComplete((ok , e) -> {
								Logger.getLogger("moreInfo").info("Asncy complete");
							});
							
						}
						System.out.println();
						EntityUtils.consume(entity);
					}else {
						System.out.println("失敗 : "+code);
					}
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Logger.getLogger("StartWebCrawler").info("End");
	}
	
	private static List<NameValuePair> setParams() {
		List<NameValuePair> params = new ArrayList<NameValuePair>();
		params.add(new BasicNameValuePair("MM_insert", "sendForm"));
		params.add(new BasicNameValuePair("country_id", ""));
		params.add(new BasicNameValuePair("area_id", ""));
		params.add(new BasicNameValuePair("cat_id", ""));
		params.add(new BasicNameValuePair("hour_id", ""));
		params.add(new BasicNameValuePair("price_id", ""));
		params.add(new BasicNameValuePair("language_id", ""));
		params.add(new BasicNameValuePair("group_id: ", ""));
		params.add(new BasicNameValuePair("keyword_id", ""));
		params.add(new BasicNameValuePair("sdate_id", ""));
		params.add(new BasicNameValuePair("edate_id", ""));
		params.add(new BasicNameValuePair("order_by", ""));
		params.add(new BasicNameValuePair("topCount", "1"));
		params.add(new BasicNameValuePair("totalNum", ""));
		params.add(new BasicNameValuePair("last_update", "0"));
		params.add(new BasicNameValuePair("showbox", "N"));
		params.add(new BasicNameValuePair("pageNo", String.valueOf(pageNo++)));
		params.add(new BasicNameValuePair("pageType", "down"));
		params.add(new BasicNameValuePair("gotoPageNo", ""));
		params.add(new BasicNameValuePair("showMoreStatus", "YES"));
		return params;
	}

	public static byte[] downLoadImage(String url) {
		String imageName = url.substring(url.lastIndexOf("/")+1);
		System.out.println("image name = " + imageName);
		String imageType = imageName.substring(imageName.lastIndexOf(".")+1);
		System.out.println("imageType = " + imageType);
		URL targetURL;
		try {
			targetURL = new URL(mainURL + url);
			System.out.println("target location : " + targetURL);
			File dirPath = new File(ImgDownloadPath );
			if (!dirPath.exists()) {
				boolean status = dirPath.mkdirs();
				System.out.println("status : " + status);
			}
			BufferedImage image = ImageIO.read(targetURL);
			ImageIO.write(image,imageType, new File(ImgDownloadPath + "/" + imageName));
			byte[] imgBytes = fileToByte(ImgDownloadPath + "/" + imageName);
			System.out.println("downLoad Image complete");
			return imgBytes;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	private static byte[] fileToByte(String savePath) throws FileNotFoundException, IOException {
		byte[] holder = null;
		
		try (
				FileInputStream fis = new FileInputStream(savePath);
				) {
			holder = new byte[fis.available()];
			fis.read(holder);
			
		} 
		
		
		return holder;
	}
	
}
