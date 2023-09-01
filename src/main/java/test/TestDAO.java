package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class TestDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	int result = 0;
	
	public TestDAO() { //생성자
		con = DBConnect.getConnect();
	}
	
	public ArrayList<TestDTO> List(){ 
		ArrayList<TestDTO> list = new ArrayList<>();
		String sql = "select * from test_board order by idgroup desc, step asc";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				TestDTO dto = new TestDTO();
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSavedate(rs.getTimestamp("savedate"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setStep(rs.getInt("step"));
				dto.setIndent(rs.getInt("indent"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}//List
	public int writeSave(TestDTO dto) {
		System.out.println("실행");
		String sql = "insert into test_board (id, name, title, content, idgroup, step, indent) "
				+ "values(test_board_seq.nextval, ?, ?, ?, test_board_seq.currval, 0, 0)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}//writeSave
	private void upHit(int id) {
		String sql = "update test_board set hit = hit + 1 where id ="+id;
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//upHit
	public TestDTO contentView(int id) {
		upHit (id);
		TestDTO dto = null;
		
		String sql = "select * from test_board where id="+id;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				dto = new TestDTO();
				
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSavedate(rs.getTimestamp("savedate"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setStep(rs.getInt("step"));
				dto.setIndent(rs.getInt("indent"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}//contentView
	public void modify(TestDTO dto) {
		String sql = "update test_board set name=?, title=?, content=? where id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			ps.setInt(4, dto.getId());
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//modify
	public void delete(int id) {
		String sql = "delete from test_board where id="+id;
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//delete
	private void replyShape(TestDTO d) {
		String sql = "update test_board set step = step+1 where idgroup=? and step>?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, d.getIdgroup());	//댓글을 단 게시글 번호를 넣어주고
			ps.setInt(2, d.getStep());	
			
			ps.executeUpdate();
			//step이 0일 때(댓글이 없을 때)는 위 sql문이 실행이 안되고 밑에 reply만 실행되서 +1이 되고
			//댓글이 달려 있어서 그 게시글에 step이 1이 있다면 그 댓글을 step을 2로 바꿔주고 
			//새로 작성되는 댓글은 +1이 되서 입력됨
			//만약, step이 2인 곳에 댓글을 달게 되면 step 1인 댓글을 제외하고 2인 댓글만 +1 되고, 지금 작성하는 댓글이 2가 됨
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//replyShape
	public void reply(TestDTO dto) {
		TestDTO d = contentView(dto.getId()); //내가 선택한 아이디 그룹 가져옴
		
		replyShape(d);
		
		String sql = "insert into test_board (id, name, title, content, idgroup, step, indent)"
				+"values(test_board_seq.nextval, ?, ?, ?, ?, ?, ?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			
			ps.setInt(4,d.getIdgroup()); //댓글을 단 게시글 번호
			ps.setInt(5, d.getStep() + 1); //최신 글이 올라오도록 +1 해주고 오름차순으로 변경
			ps.setInt(6, d.getIndent() + 1); //들여쓰기로 댓댓글 달면 점점 안쪽으로 들어가는 것을 표현
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}//reply
}
