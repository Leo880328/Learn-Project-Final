package fourth.util;

import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Table;

public class PDFDemo {
	public static void main(String[] args) { 
	    try{ 
	        PdfWriter pdfWriter = new PdfWriter("./demo2.pdf"); 
	        PdfDocument pdfDocument = new PdfDocument(pdfWriter); 
//	        PdfFont font = PdfFontFactory.createFont("E:\\pdfProject\\src\\main\\java\\simhei.ttf"); 
	        Document document = new Document(pdfDocument);
	        Table table = new Table(4); 
	        table.setWidth(500); 
	        table.addHeaderCell("header 1").addHeaderCell("header 2").addHeaderCell("header 3").addHeaderCell("header 4"); 
	        for(int i = 0; i < 16; i++) { 
	            table.addCell("中文 " + i); 
	        } 
	        document.add(table); 
	 
	        document.close(); 
	        System.out.println("完成");
	    }catch(Exception e){ 
	        e.printStackTrace(); 
	    } 
	} 
}
