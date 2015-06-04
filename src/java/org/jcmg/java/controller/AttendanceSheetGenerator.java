package org.jcmg.java.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.jcmg.hibernate.entities.NonAttendance;
import org.jcmg.hibernate.entities.Student;
import org.jcmg.hibernate.entities.User;

/**
 *
 * @author juanca
 */
public class AttendanceSheetGenerator extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-Disposition", "attachment; filename=filename.xls");

        HSSFWorkbook workbook = new HSSFWorkbook();
        HSSFSheet worksheet = workbook.createSheet("Informe Asistencia");

        // we create the title style
        HSSFCellStyle titleStyle = workbook.createCellStyle();
        HSSFFont titleFont = workbook.createFont();
        titleFont.setBold(true);
        titleFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        titleFont.setFontHeightInPoints((short) 16);
        titleStyle.setFont(titleFont);

        // we create the title
        Row titleRow = worksheet.createRow(0);
        titleRow.setRowStyle(titleStyle);
        titleRow.createCell(0).setCellValue("Correo");
        titleRow.createCell(1).setCellValue("Nombre");
        titleRow.createCell(2).setCellValue("Grupo");
        titleRow.createCell(3).setCellValue("Fecha");
        titleRow.createCell(4).setCellValue("Justificada");
        titleRow.createCell(5).setCellValue("Total Justificadas");
        titleRow.createCell(6).setCellValue("Total sin Justificar");
        titleRow.createCell(7).setCellValue("Total general");

        // we dump the data
        List<Student> students = (List<Student>) request.getSession().getAttribute("companyStudents");
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        for (int i = 1; i < students.size() + 1; i++) {
            Student student = students.get(i - 1);
            User user = student.getUser();

            Set nonAttendances = student.getNonAttendances();
            Iterator it = nonAttendances.iterator();

            int notJustifiedAttendances = 0;
            int actualAttendance = 0;            
            while (it.hasNext()) {
                int actualRow = i + actualAttendance;
                Row row = worksheet.createRow(actualRow);
                row.createCell(0).setCellValue(user.getMail());
                row.createCell(1).setCellValue(user.getFirstName() + " " + user.getLastName());
                row.createCell(2).setCellValue(student.getGroup() != null ? student.getGroup().getGroupCode() : "Sin asignar");

                NonAttendance na = (NonAttendance) it.next();
                row.createCell(3).setCellValue(sdf.format(na.getDate()));
                row.createCell(4).setCellValue(na.isProof() ? "Si" : "No");
                if (!na.isProof()) {
                    notJustifiedAttendances++;
                }

                actualAttendance++;

                if (actualAttendance == nonAttendances.size()) {
                    row.createCell(5).setCellValue(nonAttendances.size() - notJustifiedAttendances);
                    row.createCell(6).setCellValue(notJustifiedAttendances);
                    row.createCell(7).setCellValue(nonAttendances.size());
                }
            }

        }

        workbook.write(response.getOutputStream()); // Write workbook to response.
        workbook.close();
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
