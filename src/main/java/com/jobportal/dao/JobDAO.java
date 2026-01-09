package com.jobportal.dao;

import com.jobportal.dto.ApplicantDTO;
import com.jobportal.dto.JobDTO;
import com.jobportal.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class JobDAO {
    public boolean insertJob(JobDTO dto) {
        boolean isInserted = false;
        String query = "insert into jobs (recruiter_id, job_title, job_description, skills_required, experience_required,\n" +
                " location, salary_min, salary_max, status) values (?,?,?,?,?,?,?,?,?)";
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, dto.getRecruiterId());
            ps.setString(2, dto.getJobTitle());
            ps.setString(3, dto.getJobDescription());
            ps.setString(4, dto.getSkillsRequired());
            ps.setInt(5, dto.getExperienceRequired());
            ps.setString(6, dto.getLocation());
            ps.setInt(7, dto.getSalaryMin());
            ps.setInt(8, dto.getSalaryMax());
            ps.setString(9, dto.getStatus());
            isInserted = ps.executeUpdate()>0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isInserted;
    }

    public List<JobDTO> getJobsByRecruiter(int recruiterId) {
        ArrayList<JobDTO> jobs = new ArrayList<>();
        String query = "select * from jobs where recruiter_id = ?";
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, recruiterId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                JobDTO dto = new JobDTO();
                dto.setJobId(rs.getInt("job_id"));
                dto.setJobTitle(rs.getString("job_title"));
                dto.setJobDescription(rs.getString("job_description"));
                dto.setStatus(rs.getString("status"));
                dto.setSkillsRequired(rs.getString("skills_required"));
                dto.setExperienceRequired(rs.getInt("experience_required"));
                dto.setLocation(rs.getString("location"));
                dto.setSalaryMin(rs.getInt("salary_min"));
                dto.setSalaryMax(rs.getInt("salary_max"));
                jobs.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jobs;
    }

    public List<JobDTO> getAllJobs(){
        List<JobDTO> jobs = new ArrayList<>();
        String sql = "select * from jobs order by posted_date desc";
        try(Connection con = DBConnection.getConnection()){
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                JobDTO dto = new JobDTO();
                dto.setJobId(rs.getInt("job_id"));
                dto.setJobTitle(rs.getString("job_title"));
                dto.setJobDescription(rs.getString("job_description"));
                dto.setSkillsRequired(rs.getString("skills_required"));
                dto.setStatus(rs.getString("status"));
                dto.setLocation(rs.getString("location"));
                dto.setSalaryMax(rs.getInt("salary_max"));
                dto.setExperienceRequired(rs.getInt("experience_required"));

                jobs.add(dto);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return jobs;
    }

    //check if already applied
    public boolean hasAlreadyApplied(int jobId, int seekerId){
        String query = "select application_id from job_applications " +
                "where job_id = ? and seeker_id = ?";

        try(Connection con = DBConnection.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, jobId);
            ps.setInt(2, seekerId);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }catch (Exception e){
            e.printStackTrace();
        }

        return false;
    }

    //apply for job
    public boolean applyJob(int jobId, int seekerId){
        String query = "insert into job_applications (job_id, seeker_id) " +
                "values (?, ?) ";

        try(Connection con = DBConnection.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, jobId);
            ps.setInt(2, seekerId);
            return ps.executeUpdate()>0;
        }catch (Exception e){
            e.printStackTrace();
        }

        return false;
    }

    public List<ApplicantDTO> getApplicantsByRecruiter(int recruiterId){
        List<ApplicantDTO> list = new ArrayList<>();
        String query = """
        SELECT u.user_id, u.full_name, u.email, j.job_title,a.job_id
        FROM job_applications a
        JOIN users u ON a.seeker_id = u.user_id
        JOIN jobs j ON a.job_id = j.job_id
        WHERE j.recruiter_id = ?
    """;

        try(Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, recruiterId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()){
                ApplicantDTO dto = new ApplicantDTO();
                dto.setJobId(rs.getInt("job_id"));
                dto.setFullName(rs.getString("full_name"));
                dto.setSeekerId(rs.getInt("user_id"));
                dto.setEmail(rs.getString("email"));
                dto.setJobTitle(rs.getString("job_title"));
                list.add(dto);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    public List<JobDTO> getAppliedJobsBySeeker(int seekerId){

        ArrayList<JobDTO> list = new ArrayList<>();
        String query = """
                select j.job_description, j.salary_max,  j.job_title, j.location, a.applied_date
                from jobs j JOIN job_applications a\s
                ON j.job_id = a.job_id
                where a.seeker_id = ?
                ORDER BY a.applied_date DESC
                """;

        try(Connection con = DBConnection.getConnection()){
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, seekerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                JobDTO dto = new JobDTO();
                dto.setJobTitle(rs.getString("job_title"));
                dto.setLocation(rs.getString("location"));
                dto.setJobDescription(rs.getString("job_description"));
                dto.setSalaryMax(rs.getInt("salary_max"));

                list.add(dto);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }

    public Set<Integer> getAppliedJobIdsBySeeker(int seekerId){
        Set<Integer> appliedJobs = new HashSet<>();
        String query = "select job_id from job_applications where seeker_id = ?";

        try(Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, seekerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                appliedJobs.add(rs.getInt("job_id"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return appliedJobs;
    }
}
