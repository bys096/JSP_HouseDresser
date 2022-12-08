package bys21_house_dresser.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class DresserDAO {
	private PreparedStatement pstmt = null;
	private Connection con = null;
   
    Context init = null; // 컨텍스트 객체 변수
    DataSource ds = null; // 데이터소스 객체 변수
   
    ResultSet rs = null; // 쿼리결과셋 객체 변수
    
    public DresserDAO() {
    	super();
//	    dbConnect();
    }
   
    public void dbConnect() {
	    try {
		    Context init = new InitialContext();
		    DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc_mariadb");
		    con = ds.getConnection();
	    } catch (Exception e) {
		    System.out.println("DB연결 실패!!!");
		    e.printStackTrace();
	    }
    }
   
    // 데이터베이스 연결 해제 메소드
    public void disConnect() {
    	if (pstmt != null) {
    		try {
    			pstmt.close();
            } catch (SQLException e) {
            	e.printStackTrace();
            }
        }
        if (con != null) {
           try {
        	   con.close();
           } catch (SQLException e) {
             e.printStackTrace();
           }
        }
      
    // 쿼리결과셋 객체 해제 부분 추가
       if(rs != null) {
    	   try {
    		   rs.close();
    	   } catch(SQLException e) {
    		   e.printStackTrace();
    	   }
       }
    }
    
    // 회원가입
    public boolean joinUser(UserDTO user, UserAddressDTO userAddress) {
        boolean success = false;
        dbConnect();
        String sql = "INSERT INTO user(user_email, user_pwd, user_name, ";
              sql += "user_phone, email_check) ";
              sql += "values(?, ?, ?, ?, ?)";
        try {
      	  
           pstmt = con.prepareStatement(sql);
           pstmt.setString(1, user.getUser_email());
           pstmt.setString(2, user.getUser_pwd());
           pstmt.setString(3, user.getUser_name());
           pstmt.setString(4, user.getUser_phone());
           pstmt.setString(5, user.getEmail_check());
           
           pstmt.executeUpdate();
           
           sql = "INSERT INTO user_address values(?, ?, ?, ?)";
           pstmt = con.prepareStatement(sql);
           pstmt.setString(1, user.getUser_email());
           pstmt.setString(2, userAddress.getUser_zip());
           pstmt.setString(3, userAddress.getUser_address1());
           pstmt.setString(4, userAddress.getUser_address2());
           
           pstmt.executeUpdate();
           
           success = true;
           
        } catch (SQLException e) {
           e.printStackTrace();
        } finally {
           disConnect();
        }
        return success;
     }
    
    // 로그인
     public int login(String userEmail, String userPWD) {
    	 int success = 0;
    	 dbConnect();
    	 String dbEmail=null, dbPWD=null;
    	 String sql = "SELECT user_email, user_pwd FROM user\n"
    	 		+ "WHERE user_email = ?";
    	 
    	 try {
    		 pstmt = con.prepareStatement(sql);
    		 pstmt.setString(1, userEmail);
    		 ResultSet rs = pstmt.executeQuery();
    		 while(rs.next()) {
    			 dbEmail = rs.getString("user_email");
    			 dbPWD = rs.getString("user_pwd");
    		 }
    		 if(userEmail.equals(dbEmail)) {
    			 if(userPWD.equals(dbPWD)) {
    				 success = 1;
    			 }
    			 else
    				 success = 0;
//    				 success = "errorPWD";
    		 }
    		 else
    			 success = 0;
//    			 success = "errorEmail";
    		
		 } catch(SQLException e) {
			 e.printStackTrace();
		 } finally {
			 disConnect();
		 }
    	  
    	 return success;
     }
   
     
//     상품 업로드
     public boolean productUpload(ProductDTO product) {
    	 boolean success = false;
    	 dbConnect();
    	 String sql = "INSERT INTO product(user_email, product_name, product_price, ";
    	 sql += "product_stock, product_desc, product_hits)";
    	 sql += "VALUES(?, ?, ?, ?, ?, ?)";
    	 
    	 try {
    		 pstmt = con.prepareStatement(sql);
    		 pstmt.setString(1, product.getUser_email());
    		 pstmt.setString(2, product.getProduct_name());
    		 pstmt.setInt(3, product.getProduct_price());
    		 pstmt.setInt(4, product.getProduct_stock());
    		 pstmt.setString(5, product.getProdocut_desc());
    		 pstmt.setInt(6, product.getProduct_hits());
    		 pstmt.executeUpdate();
    		 
    		 success = true;
    		 System.out.println("파일 업로드 success");
    	 } catch(SQLException e) {
    		 e.printStackTrace();
    	 } finally {
    		 disConnect();
    	 }
    	 return success;
     }
     
     
//     카테고리 생성
     public boolean categoryUpload(CategoryDTO category) {
    	 boolean success = false;
    	 dbConnect();
    	 String sql = "SELECT max(product_number) AS recent_id FROM product";
    	 try {
    		 pstmt = con.prepareStatement(sql);
    		 ResultSet rs = pstmt.executeQuery();
    		 while(rs.next()) {
    			 category.setProduct_number(rs.getInt("recent_id"));
        		 System.out.println("최신 product number: " + category.getProduct_number());
    		 }
    		 
    		 
    	 } catch(SQLException e) {
    		 e.printStackTrace();
    	 }
    	 
    	 sql = "INSERT INTO product_category(category_name, product_number) VALUES(?, ?)";
    	 try {
    		 pstmt = con.prepareStatement(sql);
    		 pstmt.setString(1, category.getCategory_name());
    		 pstmt.setInt(2, category.getProduct_number());
    		 pstmt.executeUpdate();
    		 success = true;
    	 } catch(SQLException e) {
    		 e.printStackTrace();
    	 } 
    	 
    	 finally {
    		 disConnect();
    	 }
    	 return success;
     }
     
     
//     이미지 업로드
     public boolean imageUpload(ImageDTO img) {
    	 boolean success = false;
    	 dbConnect();
    	 String sql = "INSERT INTO img_tbl(product_number, i_thumbnail_name, i_original_name, ";
    	 sql += "i_file_name, i_file_type, i_file_size)";
    	 sql += "VALUES(?, ?, ?, ?, ?, ?)";
    	 try {
    		 pstmt = con.prepareStatement(sql);
    		 pstmt.setInt(1, img.getProduct_number());
    		 pstmt.setString(2, img.getI_thumbnail_name());
    		 pstmt.setString(3, img.getI_original_name());
    		 pstmt.setString(4, img.getI_file_name());
    		 pstmt.setString(5, img.getI_file_type());
    		 pstmt.setLong(6, img.getI_file_size());
    		 pstmt.executeUpdate();
    		 success = true;
    	 } catch(SQLException e) {
    		 e.printStackTrace();
    	 } finally {
    		 disConnect();
    	 } return success;
     }
     
     
//     검색
     public ArrayList<SearchDTO> getDressList(ProductDTO product, UserDTO user, ImageDTO img
    		 , String searchContent, String gender) {
    	 boolean success = false;
    	 dbConnect();
    	 ArrayList<SearchDTO> searchList = new ArrayList<SearchDTO>();
//    	 select p.product_number, u.user_email, p.product_name, p.product_price, "
//     	 		+ "p.product_stock, p.product_regdate, p.product_hits, brand_name, i_thumbnail_name\n
    	 String sql = "SELECT * "
    			 + "from user u "
    			 + "join product p "
    			 + "on p.user_email = u.user_email "
    			 + "join img_tbl i "
    			 + "on p.product_number = i.product_number "
    			 + "WHERE (p.product_name LIKE ? OR u.brand_name LIKE ?) ";
    			 
    	 		
    	 
    	 
//    	 		+ "AND product_gender = ?\n"
//    	 		+ "AND product_size = ?\n"
//    	 		+ "AND product_color = ?";
    	 
    	 if(searchContent == null)
    		 searchContent="";
    	 if(product.getGender() != null) {
    		 sql +="AND p.product_gender = ?";
    	 }
    	 
//    	 System.out.println("검색sql: " + sql);
    	 try {
    		 pstmt = con.prepareStatement(sql);
    		 pstmt.setString(1, "%"+searchContent+"%");
    		 pstmt.setString(2, "%"+searchContent+"%");
    		 if(product.getGender() != null) {
        		 pstmt.setString(3, product.getGender());
        	 }
//    		 
    		 SearchDTO search = null;
    		 ResultSet rs = pstmt.executeQuery();
    		 while(rs.next()) {
    			 search = new SearchDTO();
    			 search.setProduct_number(rs.getInt("product_number"));
    			 search.setUser_email(rs.getString("user_email"));
    			 search.setProduct_name(rs.getString("product_name"));
    			 search.setProduct_price(rs.getInt("product_price"));
    			 search.setProduct_stock(rs.getInt("product_stock"));
    			 search.setProduct_regdate(rs.getDate("product_regdate"));
    			 search.setProduct_hits(rs.getInt("product_hits"));
    			 search.setBrand_name(rs.getString("brand_name"));
    			 search.setI_thumbnail_name(rs.getString("i_thumbnail_name"));
    			 search.setI_file_name(rs.getString("i_file_name"));
    			 searchList.add(search);
    		 }
    		 success = true;
    	 } catch(SQLException e) {
    		 e.printStackTrace();
    		 disConnect();
    	 } finally {
    		 disConnect();
    	 } return searchList;
     }
     
//     유저 정보 조회
     public UserDTO getUserInfo(String user_email) {
    	 UserDTO user = new UserDTO();
    	 dbConnect();
    	 String sql = "SELECT * FROM user u JOIN user_address a ON u.user_email=a.user_email\n"
    			 	+ "WHERE u.user_email = ?";
		 try {
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, user_email);
			 ResultSet rs = pstmt.executeQuery();
			 while(rs.next()) {
				 user.setUser_email(rs.getString("user_email"));
				 user.setUser_pwd(rs.getString("user_pwd"));
				 user.setUser_name(rs.getString("user_name"));
				 user.setUser_phone(rs.getString("user_phone"));
				 user.setEmail_check(rs.getString("email_check"));
				 user.setBrand_name(rs.getString("brand_name"));
				 user.setUser_zip(rs.getString("user_zip"));
				 user.setUser_address1(rs.getString("user_address1"));
				 user.setUser_address2(rs.getString("user_address2"));
			 }
		 } catch(SQLException e) {
			 e.printStackTrace();
		 } finally {
			 disConnect();
		 }
		 return user;
     }
     
//     유저 정보 업데이트
     public boolean updateUser(UserDTO user, UserAddressDTO address) {
    	 boolean success = false;
    	 dbConnect();
    	 String sql = "UPDATE user SET user_pwd=?, user_phone=?, email_check=?, brand_name=?\n"
    	 		+ "WHERE user_email=?";
    	 try {
    		 pstmt = con.prepareStatement(sql);
    		 pstmt.setString(1, user.getUser_pwd());
    		 pstmt.setString(2, user.getUser_phone());
    		 pstmt.setString(3, user.getEmail_check());
    		 pstmt.setString(4, user.getBrand_name());
    		 pstmt.setString(5, user.getUser_email());
    		 pstmt.executeUpdate();
    	 } catch(SQLException e) {
    		 e.printStackTrace();
    	 } 
    	 sql = "UPDATE user_address SET user_zip=?, user_address1=?, user_address2=? WHERE user_email=?";
    	 try {
    		 pstmt = con.prepareStatement(sql);
    		 pstmt.setString(1, address.getUser_zip());
    		 pstmt.setString(2, address.getUser_address1());
    		 pstmt.setString(3, address.getUser_address2());
    		 pstmt.setString(4, user.getUser_email());
    		 pstmt.executeUpdate();
    		 success=true;
    	 } catch(SQLException e) {
    		 e.printStackTrace();
    	 } finally {
    		 disConnect();
    	 } return success;
     }
     
//     회원 탈퇴
     public boolean deleteUser(String user_email) {
    	 boolean success = false;
    	 dbConnect();
    	 String sql = "DELETE FROM user_address WHERE user_email=?";
    	 try {
    		 pstmt = con.prepareStatement(sql);
    		 pstmt.setString(1, user_email);
    		 pstmt.executeUpdate();
    	 } catch(SQLException e) {
    		 e.printStackTrace();
    	 }
    	 
    	 
    	 
    	 sql = "SET foreign_key_checks = 0;";
    	 try {
    		 pstmt = con.prepareStatement(sql);
    		 pstmt.executeUpdate();
    	 } catch(SQLException e) {
    		 e.printStackTrace();
    	 }
    	 
    	 
    	 sql = "DELETE FROM user WHERE user_email=?";
    	 try {
    		 pstmt = con.prepareStatement(sql);
    		 pstmt.setString(1, user_email);
    		 pstmt.executeUpdate();
    		 success = true;
    	 } catch(SQLException e) {
    		 e.printStackTrace();
    	 } finally {
    		 disConnect();
    	 } return success;
     }
		
     
//     판매자 상품조회
     public ArrayList<SearchDTO> getDressListForSeller(String user_email) {
    	 boolean success = false;
    	 dbConnect();
    	 ArrayList<SearchDTO> searchList = new ArrayList<SearchDTO>();
//    	 select p.product_number, u.user_email, p.product_name, p.product_price, "
//     	 		+ "p.product_stock, p.product_regdate, p.product_hits, brand_name, i_number, i_thumbnail_name\n"
    	 String sql = "SELECT *\n"
    	 		+ "from user u\n"
    	 		+ "join product p\n"
    	 		+ "on p.user_email = u.user_email\n"
    	 		+ "join img_tbl i\n"
    	 		+ "on p.product_number = i.product_number\n"
    	 		+ "WHERE u.user_email = ?";
    	 		
    	 try {
    		 pstmt = con.prepareStatement(sql);
    		 pstmt.setString(1, user_email);
    		 ResultSet rs = pstmt.executeQuery();
    		 while(rs.next()) {
    			 SearchDTO search = new SearchDTO();
    			 search.setProduct_number(rs.getInt("product_number"));
    			 search.setUser_email(rs.getString("user_email"));
    			 search.setProduct_name(rs.getString("product_name"));
    			 search.setProduct_price(rs.getInt("product_price"));
    			 search.setProduct_stock(rs.getInt("product_stock"));
    			 search.setProduct_regdate(rs.getDate("product_regdate"));
    			 search.setProduct_hits(rs.getInt("product_hits"));
    			 search.setBrand_name(rs.getString("brand_name"));
    			 search.setI_number(rs.getInt("i_number"));
    			 search.setI_thumbnail_name(rs.getString("i_thumbnail_name"));
//    			 search.setI_file_name(rs.getString("i_file_name"));
    			 search.setProduct_desc(rs.getString("product_desc"));
    			 searchList.add(search);
    		 }
    		 success = true;
    	 } catch(SQLException e) {
    		 e.printStackTrace();
    	 } finally {
    		 disConnect();
    	 } return searchList;
     }
     
     
     
//     상품 삭제 by 판매자
     public boolean deleteProduct(int product_number) {
    	 boolean success = false;
    	 dbConnect();
    	 String sql = "DELETE FROM product WHERE product_number = ?";
    	 try {
    		 pstmt = con.prepareStatement(sql);
    		 pstmt.setInt(1, product_number);
    		 pstmt.executeUpdate();
    	 } catch(SQLException e) {
    		 e.printStackTrace();
    	 }
    	 sql = "DELETE FROM product_category WHERE product_number = ?";
    	 try {
    		 pstmt = con.prepareStatement(sql);
    		 pstmt.setInt(1, product_number);
    		 pstmt.executeUpdate();
    	 } catch(SQLException e) {
    		 e.printStackTrace();
    	 }
    	 sql = "DELETE FROM img_tbl WHERE product_number = ?";
    	 try {
    		 pstmt = con.prepareStatement(sql);
    		 pstmt.setInt(1, product_number);
    		 pstmt.executeUpdate();
    		 success = true;
    	 } catch(SQLException e) {
    		 e.printStackTrace();
    	 } finally {
    		 disConnect();
    	 } return success;
     }
     
//     상품 수정 by 판매자
     public boolean updateProduct(ProductDTO product, CategoryDTO category, ImageDTO img) {
    	 boolean success = false;
    	 dbConnect();
    	 // 프로덕트 수정
    	 String sql = "UPDATE product SET product_name=?, product_price=?, product_stock=?,\n"
    	 		+ "product_desc=? WHERE product_number = ?";
    	 try {
    		 pstmt = con.prepareStatement(sql);
    		 pstmt.setString(1, product.getProduct_name());
    		 pstmt.setInt(2, product.getProduct_price());
    		 pstmt.setInt(3, product.getProduct_stock());
    		 pstmt.setString(4, product.getProdocut_desc());
    		 pstmt.setInt(5, product.getProduct_number());
    		 pstmt.executeUpdate();
    		 
    	 } catch(SQLException e) {
    		 e.printStackTrace();
    	 }
    	 sql = "UPDATE product_category SET category_name=? WHERE product_number=?";
    	 try {
    		 pstmt = con.prepareStatement(sql);
    		 pstmt.setString(1, category.getCategory_name());
    		 pstmt.setInt(2, product.getProduct_number());
    		 pstmt.executeUpdate();
    	 } catch(SQLException e) {
    		 e.printStackTrace();
    	 }
    	 sql = "UPDATE img_tbl SET i_thumbnail_name=?, i_original_name=?,\n"
    	 		+ "i_file_name=?, i_file_type=?, i_file_size=?\n"
    	 		+ "WHERE product_number=?";
    	 try {
    		 pstmt = con.prepareStatement(sql);
    		 pstmt.setString(1, img.getI_thumbnail_name());
    		 pstmt.setString(2, img.getI_original_name());
    		 pstmt.setString(3, img.getI_file_name());
    		 pstmt.setString(4, img.getI_file_type());
    		 pstmt.setLong(5, img.getI_file_size());
    		 pstmt.setInt(6, product.getProduct_number());
    		 pstmt.executeUpdate();
    		 success = true;
    	 } catch(SQLException e) {
    		 e.printStackTrace();
    	 }
    	 finally {
    		 disConnect();
    	 }
    	 return success;
    	 
     }
}
