package com.jobportal.dao;

import com.jobportal.dto.UserDTO;
import com.jobportal.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class UserDAO {

    public boolean registerUser(UserDTO dto){
        boolean isRegisterd = false;
        String query = "insert into users (full_name, email, password, role, status) values (?, ?, ?, ?, ?)";

        try(Connection con = DBConnection.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, dto.getFullName());
            ps.setString(2, dto.getEmail());
            ps.setString(3, dto.getPassword());
            ps.setString(4, dto.getRole());
            ps.setString(5, dto.getStatus());

            int count = ps.executeUpdate();
            isRegisterd = count > 0;


        }catch (Exception e){
            e.printStackTrace();
        }

        return isRegisterd;
    }

    public UserDTO loginUser(String email, String password){
        UserDTO dto = null;
        String query = "select * from users where email = ? and password = ? and status = 'ACTIVE'";

        try(Connection con = DBConnection.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                dto = new UserDTO();
                dto.setUserid(rs.getInt("user_id"));
                dto.setEmail(rs.getString("email"));
                dto.setRole(rs.getString("role"));
                dto.setFullName(rs.getString("full_name"));
                dto.setStatus(rs.getString("status"));

            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return dto;
    }

    public List<UserDTO> getPendingRecruiters(){
        ArrayList<UserDTO> recruiters = new ArrayList<>();

        String query = "select * from users where role = 'RECRUITER' AND status = 'PENDING'";

        try(Connection con = DBConnection.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                UserDTO dto = new UserDTO();
                dto.setUserid(rs.getInt("user_id"));
                dto.setEmail(rs.getString("email"));
                dto.setFullName(rs.getString("full_name"));

                recruiters.add(dto);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return recruiters;
    }

    public boolean approveRecruiter(int userid){

        String query = "update users set status = 'ACTIVE' where user_id = ? and role = 'RECRUITER'";
        try(Connection con = DBConnection.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userid);
            return ps.executeUpdate() > 0;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
}
