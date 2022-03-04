package admin.order.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter @Setter @ToString
public class OrderDTO {
	private int orderId;
	private int userId;
	private int paymentId;
	private int productId;
	private int deliveryId;
	private int addressId;
	private String phoneNum;
	@JsonFormat(pattern="yyyy/MM/dd HH:mm:ss")
	private Date orderDate;
	
}
