package member.back.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import member.model.MemberBasic;
import member.model.MemberInfo;
import oracle.net.aso.q;


@Repository
public class MemberBasicBackDAO {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public static String[] firstName = {
			"趙", "錢", "孫", "李", "周", "吳", "鄭", "王", 
			"俞", "任", "袁", "柳", "酆", "鮑", "史", "唐",
			"費", "廉", "岑", "薛", "雷", "賀", "倪", "湯",
			"滕", "殷", "羅", "畢", "郝", "鄔", "安", "常",
			"樂", "于", "時", "傅", "皮", "卞", "齊", "康",
			"伍", "余", "元", "卜", "顧", "孟", "平", "黃",
			"和", "穆", "蕭", "尹", "姚", "邵", "湛", "汪",
			"祁", "毛", "禹", "狄", "米", "貝", "明", "臧",
			"成", "戴", "談", "宋", "龎", "熊", "紀", "舒",
			"屈", "項", "祝", "董", "梁", "杜", "阮", "藍", 
			"閔", "席", "季", "賈", "路", "婁", "危", "江",
			"童", "顏", "郭",	"梅", "盛", "林", "刁", "鍾",
			"徐", "邱", "駱", "高", "夏", "蔡", "田", "樊",
			"胡", "凌", "霍", "虞", "萬", "支", "柯", "管",
			"盧", "莫", "房", "裘", "繆", "解", "應", "宗",
			"丁", "宣", "鄧", "單", "洪", "包", "左", "石",
			"崔", "吉", "鈕", "龔", "程", "嵇", "邢", "裴",
			"陸", "榮", "翁",	"荀", "羊", "於", "甄", "曲",
			"井", "段", "富", "巫", "烏", "焦", "巴", "谷",
			"車", "侯", "蓬", "全", "郗", "班", "秋", "仲",
			"伊", "宮", "甯", "仇", "甘", "厲", "戎", "祖",
			"武", "符", "劉", "詹", "龍", "葉", "幸", "司",
			"黎", "白", "蒲", "邰", "鄂", "索", "籍", "賴",
			"卓", "藺", "屠",	"池", "喬", "胥", "能", "聞",
			"翟", "譚", "貢", "姬", "申", "冉", "宰", "酈",
			"雍", "郤", "璩", "桑", "桂", "牛", "邊", "扈",
			"燕", "冀", "尚",	"溫", "別", "莊", "晏", "柴",
			"瞿", "閻", "連", "茹", "習", "艾",	"向", "古",
			"易", "戈", "廖", "庾", "居", "衡", "都", "耿",
			"滿", "匡", "國", "文", "廣", "歐", "師", "鞏",
			"聶", "晁", "冷", "辛", "那", "簡", "饒", "曾",
			"鞠", "游", "竺", "權", "逯", "蓋", "益", "桓",
			"公", "司馬", "上官", "歐陽", "夏侯", "諸葛", "聞人",
			"東方", "皇甫", "尉遲", "公羊", "澹臺", "公冶", "宗政",
			"濮陽", "淳于", "公孫", "仲孫", "軒轅", "令狐", "鍾離",
			"宇文", "長孫", "慕容", "鮮于", "閭丘", "司徒", "司空",
			"司寇", "端木", "巫", "馬", "公西", "公良", "晉", "楚",
			"百里", "呼延", "岳", "帥", "況", "梁丘", "左丘", "西門",
			"南宮", "墨", "哈", "譙", "年", "陽", "佟"	
	};
	
	public static String[] lastNameBoy = {
			"家豪", "宗翰", "	志豪", "	建宏", "	志偉", "俊宏", "佳穎", "俊傑", "彥廷",
			"冠宇", "家瑋", "	承翰", "柏翰", "思穎", "俊賢", "家銘", "冠廷", "信宏",
			"威廷", "哲瑋", "智偉", "俊豪", "宗憲", "哲維", "志宏", "冠宏", "士豪", "家榮",
			"嘉宏", "偉倫", "建志", "孟儒", "明哲", "俊廷", "志鴻", "彥君", "宗霖", "俊毅",
			"建良", "政宏", "建銘", "柏宏", "志強", "仁傑", "書豪", "志銘", "智凱", "佳霖",
			"士傑", "智翔", "建宇", "子豪", "偉哲", "俊凱", "嘉文", "建豪", "立偉", "志明",
			"家宏", "明宏", "書瑋", "俊佑", "凱翔", "文傑", "建勳", "博文", "彥宏", "志遠", "宇軒",
			"冠霖", "建智", "俊銘", "哲宇", "家維", "柏勳", "凱文", "建文", "明翰", "人豪", "宗穎",
			"智傑", "文彥", "世偉"
	};
	
	public static String[] lastNameGirl = {
			"怡君", "雅婷", "欣怡", "雅雯", "怡婷", "雅惠", "心怡", "佳蓉", "佩珊",
			"靜怡", "雅玲", "佩君", "佳穎", "怡伶", "婉婷", "郁婷", "怡如", "鈺婷",
			"靜宜", "彥廷", "佳玲", "詩婷", "家瑋", "詩涵", "佳慧", "惠雯", "宜君",
			"雅琪", "雅文", "	韻如", "思穎", "玉婷", "淑芬", "琬婷", "怡靜", "雅萍",
			"怡萱", "婷婷", "惠婷", "淑娟", "馨儀", "雅慧", "淑惠", "佩蓉", "淑婷",
			"宜芳", "佳樺", "珮瑜", "嘉玲", "依婷", "雅芳", "欣儀", "慧君", "芳瑜",
			"家瑜", "雅涵", "宜靜", "筱婷", "佳琪", "怡文"
			
	};
	
	public static String[] allName = {
			"家豪", "宗翰", "	志豪", "	建宏", "	志偉", "俊宏", "佳穎", "俊傑", "彥廷",
			"冠宇", "家瑋", "	承翰", "柏翰", "思穎", "俊賢", "家銘", "冠廷", "信宏",
			"威廷", "哲瑋", "智偉", "俊豪", "宗憲", "哲維", "志宏", "冠宏", "士豪", "家榮",
			"嘉宏", "偉倫", "建志", "孟儒", "明哲", "俊廷", "志鴻", "彥君", "宗霖", "俊毅",
			"建良", "政宏", "建銘", "柏宏", "志強", "仁傑", "書豪", "志銘", "智凱", "佳霖",
			"士傑", "智翔", "建宇", "子豪", "偉哲", "俊凱", "嘉文", "建豪", "立偉", "志明",
			"家宏", "明宏", "書瑋", "俊佑", "凱翔", "文傑", "建勳", "博文", "彥宏", "志遠", "宇軒",
			"冠霖", "建智", "俊銘", "哲宇", "家維", "柏勳", "凱文", "建文", "明翰", "人豪", "宗穎",
			"智傑", "文彥", "世偉", "怡君", "雅婷", "欣怡", "雅雯", "怡婷", "雅惠", "心怡", "佳蓉", "佩珊",
			"靜怡", "雅玲", "佩君", "佳穎", "怡伶", "婉婷", "郁婷", "怡如", "鈺婷",
			"靜宜", "彥廷", "佳玲", "詩婷", "家瑋", "詩涵", "佳慧", "惠雯", "宜君",
			"雅琪", "雅文", "	韻如", "思穎", "玉婷", "淑芬", "琬婷", "怡靜", "雅萍",
			"怡萱", "婷婷", "惠婷", "淑娟", "馨儀", "雅慧", "淑惠", "佩蓉", "淑婷",
			"宜芳", "佳樺", "珮瑜", "嘉玲", "依婷", "雅芳", "欣儀", "慧君", "芳瑜",
			"家瑜", "雅涵", "宜靜", "筱婷", "佳琪", "怡文"
	};
	
	public static final String[] ncName = {"尼莫", "織田信勝", "齊藤一", "卑彌呼", "紫式部", "巴御前", "愛比蓋爾",
			"威廉斯", "伊莉亞", "蘇菲爾", "愛因茲貝倫", "殺生院", "祈荒", "繪里世", "紅葉", "Voyager", "羅慕路斯", "奎里努斯", "凱妮絲", "迪奧斯", "庫洛伊", "奧德修斯", "清少納言", "歐羅巴", "曼迪卡爾多", "俄里翁", "葛飾北齋", "卡蜜拉", 
			"刑部姬", "莎樂美", "夏綠蒂", "克莉絲汀", "黛也", "加雷斯", "帕里斯", "伊阿宋", "長尾警虎", "森長可", "阿斯克勒庇厄斯", "阿周那", "威廉", "拉克什米", "吉娜可", "加里吉利", "格雷", "格蕾", "阿斯特", "雷亞", "蕾亞", "萊涅斯", "BeastIII", "伽摩", "帝王花", "美遊", "愛蒂爾菲爾特", "李書文", 
			"閻魔", "奎札爾", "柯爾特亞", "布拉達曼特", "赤兔", "蘭陵王", "項羽", "酒吞童子", "志度內", "迪爾姆德", "奧德利暗", "謎之女主角", "梅芙", "BB", "Alter", "茨木童子", "斯卡薩哈", "斯卡蒂", "瓦爾基麗亞", "齊格魯德", "拿破崙",
			"拿破熊", "以藏", "龍馬", "總司", "沖田總司", "齊格", "凱隆", "阿基里斯", "伊凡", "雷帝", "安東尼奧", "薩里耶利", "阿維斯布隆", "阿塔蘭塔", "安娜塔西亞", "安娜卡列妮娜", "淺上藤乃", "賽彌拉彌斯", "阿提拉", "愛蕾", "修卡",
			"哪吒", "克爾克", "II號機", "I號機", "初號機", "零號機", "伊莉醬", "加藤段藏", "柳生宗矩", "旦馬守", "寶藏院", "胤舜", "望月", "千代女", "帕爾瓦帝", "伊斯塔", "源賴光", "海倫娜", "布拉瓦茨基", "尼托克里斯", "尼祿",
			"克勞狄烏斯", "班楊", "夏洛克", "福爾摩斯", "莫提亞提", "彭忒希勒亞", "PassionLip", "Meltryllis", "土方歲三", "Prototype", "燕青", "海森", "Emiya", "山之翁", "所羅門", "蓋提亞", "迪亞馬特", "戈爾貢", "基加美修", "恩奇都", "Lily",
			"克麗奧佩脫拉", "Brave", "克洛伊", "瑪爾大", "清姬", "莫德雷德", "俵藤太", "靜謐", "高維", "崔斯坦", "奧茲曼迪亞斯", "Assassin", "Saber", "Rider", "Caster", "Berserker", "Lancer", "Archer", "伊斯坎達爾", "天草四郎", "Bride", "貝奧武夫", "麥克庫爾", "傑基爾", "海德", "查爾斯", "巴貝奇", "帕拉賽爾斯",
			"童謠", "大流士", "卡利古拉", "斯巴達克斯", "瑪塔", "絲忒諾", "美狄亞", "布狄卡", "伊莉莎白", "尤瑞艾莉", "瑪修", "耀眼星星", "悠閒咖啡", "希望號", "疾風號", "Snake", "埃齊歐", "Ezio", "阿泰爾", "康納", "肯威",
			"海爾森", "伊薇", "亞克", "雅各", "亞諾", "啟示錄", "Cathrine", "Cumpston", "Ganas", "Zevvi", "Vashon", "kazy", "lia", "manville", "millay", "Ying", "Echo", "Finka", "Hibana", "Dokkaebi", "Kapkan",
			"Lion", "ACE", "ARUNI", "ZERO", "MELUSI", "ORyx", "iAna", "WamAi", "KALI", "amaru", "Goyo", "NoKK", "waRDen", "MozZie", "Gridlock", "nomAd", "KAID", "clash", "Maverick", "Maestro", "ALIBI", "puLse", "Thermite",
			"ViGil", "ZOFIA", "eLA", "LeSion", "MIRA", "JACKAL", "EcHo", "Caveira", "cApitao", "BLACKbeard", "Valkyrie", "BUCK", "FROST", "MUTe", "sLedGe", "THATCHER", "ASH", "CASTLE", "MonTagNe", "Twitch", "RoOk", "Jager", "BANdIT", "BLITz",
			"iQ", "FUZE", "Glaz", "TaCHAnKA"};
	
	public static final String[] gender = {"male", "female", "x", "mask"};
	
	public static final String email = "@gmail";
	
	public static final String[] group = {"一般登山者", "未認證登山者", "登山嚮導", "未認證登山嚮導", "停權登山者", "停權嚮導"};
	
	
	//確認登入
	public boolean checkLogin(String account, String password) {
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From MemberBasic where account = ?0 and password = ?1", MemberBasic.class);
		query.setParameter(0, account);
		query.setParameter(1, password);
		
		MemberBasic qBean = query.uniqueResult();
		
		if(qBean.getMemberStatus().getSeqno() == 150) {
			return true;
		}
		return false;
	}
	
	
	//驗證帳號是否重複
	public boolean checkAnt(String account) {
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From MemberBasic where account = ?0", MemberBasic.class);
		query.setParameter(0, account);
		
		MemberBasic qBean = query.uniqueResult();
		
		if(qBean != null) {
			return true;
		}
		return false;
	}
	
	
	
	//註冊
	public MemberBasic insert(MemberBasic mb) {
		Session session = sessionFactory.getCurrentSession();
		MemberBasic result = session.get(MemberBasic.class, mb.getSeqno());
		if(result == null) {
			session.save(mb);
			return mb;
		}
		
		return null;
	}
	
	
	//單筆查詢
	public List<MemberBasic> selectLT(int seqno){
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From MemberBasic where seqno = ?0", MemberBasic.class);
		query.setParameter(0, seqno);
		
		List<MemberBasic> mb = query.list();
		
		for (MemberBasic mbList : mb) {
			
		}
		
		return mb;
	}
	
	public List<MemberBasic> select(String account) {
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From MemberBasic where account = ?0", MemberBasic.class);
		query.setParameter(0, account);
		
		List<MemberBasic> mb = query.list();
		
		for (MemberBasic mblist : mb) {
			
		}
		
		return mb;
		
	}
	
	public List<MemberBasic> selectST(int statusId){
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From MemberBasic where memberStatus.seqno = ?0", MemberBasic.class);
		query.setParameter(0, statusId);
		
		List<MemberBasic> mb = query.list();
		for(MemberBasic mblist : mb) {
			
		}
		return mb;
	}
	
	public MemberBasic select(String account, String password) {
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From MemberBasic where account = ?0 and password = ?1", MemberBasic.class);
		query.setParameter(0, account);
		query.setParameter(1, password);
		
		MemberBasic qBean = query.uniqueResult();
		if(qBean != null) {
			return qBean;
		}
		return null;
	}
	
	
	
	public MemberBasic select(int seqno) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(MemberBasic.class, seqno);
	}
	
	
	//總查詢
	public List<MemberBasic> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From MemberBasic", MemberBasic.class);
		List<MemberBasic> mb = query.list();
		
		for(MemberBasic mblist : mb) {
			
		}
		
		return mb;
	}
	
	public List<MemberInfo> selectGdAll(String gender){
		Session session = sessionFactory.getCurrentSession();
		Query<MemberInfo> query = session.createQuery("From MemberInfo where gender = ?0", MemberInfo.class);
		query.setParameter(0, gender);
		
		List<MemberInfo> mbList = query.list();
		
		return mbList;
	}
	
	public List<MemberBasic> selectReg(int reg_Date){
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From MemberBasic where reg_Date = ?0", MemberBasic.class);
		query.setParameter(0, reg_Date);
		
		List<MemberBasic> mbList = query.list();
		
		return mbList;
	}
	
	//更新
	public MemberBasic update(MemberBasic mb) {
		Session session = sessionFactory.getCurrentSession();
		MemberBasic result = session.get(MemberBasic.class, mb.getSeqno());
		
		if(result != null) {
			session.update(mb);
			return mb;
		}
		
		return null;
	}
	
	
	public List<MemberBasic> updateLT(MemberBasic mb) {
		Session session = sessionFactory.getCurrentSession();
		Query<MemberBasic> query = session.createQuery("From MemberBasic where seqno = ?0", MemberBasic.class);
		query.setParameter(0, mb.getSeqno());
		
		List<MemberBasic> qList = query.list();
		
		if(qList != null) {
			session.update(qList);
			return qList;
		}
		return null;
	}
	
	
	//亂數生成會員資料
	//帳號
	public String getAccount() {
		StringBuilder sb = new StringBuilder();
		int i;
		for(i = 1; i <= 8; i++) {
			if(i == 1) {
				sb.append((char)(((Math.random() * 26) + 65)));
			}else if(i >= 2 && i <= 5) {
				sb.append((char)(((Math.random() * 26) + 97)));
			}else if(i >= 6 && i <= 8){
				sb.append((int)(Math.random() * 10) + 1);
			}
			
		}
		return sb.toString();
	}
	
	//姓名
	public String getName() {
		Random random = new Random(System.currentTimeMillis());
		int nameIndex = random.nextInt(firstName.length-1);
		String name = firstName[nameIndex];
		
		String gdStr = getGender();
		
		int allIndex = random.nextInt(allName.length-1);
		String allStr = allName[allIndex];
		
		
		if(gdStr == "male") {
			name = name + getLastBoyName();
		}else if(gdStr == "female"){
			name = name + getLastGirlName();
		}else{
			name = name + allStr;
		}
		return name;
	}
	
	//男生姓名
	public static String getLastBoyName() {
		Random random = new Random(System.currentTimeMillis());
		int lastIndex = random.nextInt(lastNameBoy.length-1);
		String boyName = lastNameBoy[lastIndex];
		return boyName;
	}
	
	//女生姓名
	public static String getLastGirlName() {
		Random random = new Random(System.currentTimeMillis());
		int lastIndex = random.nextInt(lastNameGirl.length-1);
		String girlName = lastNameGirl[lastIndex];
		return girlName;
	}
	
	public String getEmail() {
		StringBuilder sb = new StringBuilder();
		int i;
		for(i = 0; i <= 9; i++) {
			if(i >= 0 && i <= 6) {
				sb.append((char)(((Math.random() * 26) + 97)));
			}else if (i >= 7 && i <= 9) {
				sb.append((int)(Math.random() * 10) + 1);
			}
		}
		String emailSb = (sb.toString() + email);
		return emailSb;
	}
	
	//性別
	public String getGender() {
		Random random = new Random(System.currentTimeMillis());
		int gdIndex = random.nextInt(gender.length-1);
		String gdStr = gender[gdIndex];
		return gdStr;
	}
	
	//手機
	public String getPhone() {
		StringBuilder sb = new StringBuilder();
		int i;
		for(i = 1; i <= 8; i++) {
			sb.append((int)(Math.random() * 10));			
		}
		String title = "09";
		String phoneStr = title + sb.toString();
		return phoneStr;
	}
	
	//註冊日期
	public String getregDate() {
		Random random = new Random();
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
		
		calendar.set(1990, 0, 1);
		long start = calendar.getTimeInMillis();
		
		calendar.set(2020, 11, 20);
		long end = calendar.getTimeInMillis();
		
		for (int i = 0; i < 10; i++) {
			date = new Date(start + (long)(random.nextDouble() * (end - start)));
		}
		String dateStr = format.format(date);
		return dateStr;
	}
	
	//生日日期
	public String getbirDate() {
		Random random = new Random();
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
		
		calendar.set(1960, 0, 1);
		long start = calendar.getTimeInMillis();
		
		calendar.set(2010, 11, 20);
		long end = calendar.getTimeInMillis();
		
		for (int i = 0; i < 10; i++) {
			date = new Date(start + (long)(random.nextDouble() * (end - start)));
		}
		String dateStr = format.format(date);
		return dateStr;
	}
	
	//身分組
	public String getGroup() {
		Random random = new Random(System.currentTimeMillis());
		int gpIndex = random.nextInt(group.length-1);
		String gpName = group[gpIndex];
		return gpName;
	}
	
	public String getNcName() {
		Random random = new Random(System.currentTimeMillis());
		int ncIndex = random.nextInt(ncName.length-1);
		String ncStr = ncName[ncIndex];
		return ncStr;
	}
}
