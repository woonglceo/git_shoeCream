package admin.order.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter @Setter @ToString
public class OrderDTO2 {
//	private int orderId;
	private OrderDTO orderDTO;
//	private UserDTO userDTO;
//	private PaymentDTO paymentDTO;
//	private ProductDTO productDTO;
//	private DeliveryDTO deliveryDTO;
//	private AddressDTO addressDTO;
	private String phoneNum;
	@JsonFormat(pattern="yyyy/MM/dd HH:mm:ss")
	private Date orderDate;
	
}
