package com.studerw.activiti.model.document;

import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;

import com.studerw.activiti.model.TradeAlerts;

/**
 * @author William Studer
 */
public class BookReport extends Document {

    public final static String WORKFLOW_ID = "bookReportWorkflow";

    @NotEmpty
    private String bookAuthor;
    @NotEmpty
    private String bookTitle;
    @NotEmpty
    private String content;
    @NotEmpty
    private String summary;
    
    private List<TradeAlerts> tradeAlerts;

    public BookReport() {
        super();
        this.docType = DocType.BOOK_REPORT;
    }

    
    public List<TradeAlerts> getTradeAlerts() {
		return tradeAlerts;
	}


	public void setTradeAlerts(List<TradeAlerts> tradeAlerts) {
		this.tradeAlerts = tradeAlerts;
	}


	public String getBookAuthor() {
        return bookAuthor;
    }

    public void setBookAuthor(String bookAuthor) {
        this.bookAuthor = bookAuthor;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    @Override public String toString() {
        final StringBuilder sb = new StringBuilder("BookReport{");
        sb.append(super.toString());
        sb.append("bookAuthor='").append(bookAuthor).append('\'');
        sb.append(", bookTitle='").append(bookTitle).append('\'');
        sb.append(", content='").append(content).append('\'');
        sb.append(", summary='").append(summary).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
