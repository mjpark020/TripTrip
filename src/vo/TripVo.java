package vo;

public class TripVo {
	// Fields
	private int num;
	private String tag;
	private String title;
	private String writer;
	private String content;
	
	
	public TripVo() {
		
	}
	
	
	
	public TripVo(int num, String tag, String title, String writer, String content) {
		super();
		this.num = num;
		this.tag = tag;
		this.title = title;
		this.writer = writer;
		this.content = content;
	}
	
	public TripVo(int num, String tag, String title, String writer) {
		super();
		this.num = num;
		this.tag = tag;
		this.title = title;
		this.writer = writer;
	}
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}


	public  String  toJSON() {
		String  fmt = "";
		fmt    +=  "{";
		fmt    +=  "\"num\"    : \"%d\",";
		fmt    +=  "\"tag\"    : \"%s\",";
		fmt    +=  "\"title\"  : \"%s\",";
		fmt    +=  "\"writer\" : \"%s\",";
		fmt    +=  "\"content\" : \"%s\"";
		fmt    +=  "}";
		//content = content.replace("\r\n", "\\r\\n");
		content = content.replaceAll("\\n", "\\r\\n");
		
		  
		
		
		String json = String.format(fmt, 
			num,tag, title, writer, content);
		return  json;
	}


	@Override
	public String toString() {
		String fmt = "[%d] %s %s %s";
		String msg = String.format(fmt, 
				num, tag, title, writer, content);
		return msg;
	}
	
	

	
}