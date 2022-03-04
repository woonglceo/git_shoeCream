package admin.stock.bean;

import java.util.Date;
import org.springframework.stereotype.Component;
import lombok.Data;

@Component
@Data
public class StockDTO {
	
	private int stockId;
	private String modelId;
	private int productSize;
	private Date stockDate;

	
	
}
