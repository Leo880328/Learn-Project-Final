package fourth.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fourth.bean.ColumnBean;
import fourth.dao.ColumnRepository;

@Service
@Transactional
public class ColumnService {
	@Autowired
	private ColumnRepository columnRepository;
	
	public ColumnBean insertColumn(ColumnBean column) {
		System.err.println(column.getPicture());
		return columnRepository.save(column);
	}
	public ColumnBean updateColumn(ColumnBean column) {
		return columnRepository.save(column);
	}
	public ColumnBean selectByArticleNo(int article_no) {
		Optional <ColumnBean> optional = columnRepository.findById(article_no);
		if(optional.isPresent()) {
			return optional.get();			
		}
		return null;
	}
	public List<ColumnBean> selectAllColumns() {
		return columnRepository.findAll();
	}
	public void deleteColumnByNo(int article_no) {
		columnRepository.deleteById(article_no);
	}
	public List<ColumnBean> findByEnglish(String subject){
		return columnRepository.findByEnglish(subject);
	}
	public List<ColumnBean>findByAuthor(String author){
		return columnRepository.findByAuthor(author);
	}
	
}
