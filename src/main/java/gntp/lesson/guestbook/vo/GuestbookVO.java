package gntp.lesson.guestbook.vo;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class GuestbookVO {
	private int seq;
	private String user_id;
	private String title;
	private String content;
	private Timestamp regDate;
	private int readCount;
	private List<ReplyVO> replyList;
	
	public GuestbookVO() {}
	public GuestbookVO(int seq,String user_id, String title, String content, Timestamp regDate, int readCount) {
		this.seq = seq;
		this.user_id = user_id;
		this.title = title;
		this.content = content;
		this.regDate = regDate;
		this.readCount = readCount;
	}
	
	public List<ReplyVO> getReplyList() {
		return replyList;
	}
	public void setReplyList(List<ReplyVO> replyList) {
		this.replyList = replyList;
	}
	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getUserId() {
		return user_id;
	}

	public void setUserId(String userId) {
		this.user_id = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	
}
