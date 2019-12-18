package com.nf.controller.order;

import com.github.pagehelper.PageInfo;
import com.nf.entity.OrderEntity;
import com.nf.entity.OrderItemEntity;
import com.nf.service.OrderItemService;
import com.nf.service.OrderService;
import com.nf.vo.ResponseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderItemService orderItemService;

	// 主界面
	@RequestMapping("/index")
	public String index() {
		return "/be/order/index";
	}

	//查询订单

	@RequestMapping("/list")
	@ResponseBody
	public ResponseVO list(@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum) {
		PageInfo pageInfo = new PageInfo(orderService.getPageHelper(pageNum, 3), 5);
		return ResponseVO.newBuilder().code("200").data(pageInfo).message("ok").build();
	}

	//条件查询订单
	@RequestMapping("/search")
	@ResponseBody
	public ResponseVO search(
			@RequestParam(value = "pageNum", defaultValue = "1", required = false) int pageNum, String orderNo) {
		PageInfo pageInfo = new PageInfo(orderService.searchName(pageNum, 3, orderNo), 5);
		ResponseVO vo = ResponseVO.newBuilder().code("200").data(pageInfo).message("ok").build();
		return vo;
	}

	//查询订单详情的界面

	@RequestMapping("/details")
	public ModelAndView details(@RequestParam(value = "details", required = false) String details) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("details", details);
		modelAndView.setViewName("/be/order/OrderDetails");
		return modelAndView;
	}
//	查询单个订单

	@RequestMapping("/getByOrderNo")
	@ResponseBody
	public ResponseVO getByOrderNo(@RequestParam(value = "orderNo", required = false) String orderNo) {
		System.out.println("orderNo = " + orderNo);
		OrderEntity orderEntity = orderService.getByOrderNo(orderNo);
		System.out.println(orderEntity.toString());
		return ResponseVO.newBuilder().data(orderEntity).build();
	}

//	查询订单项

	@RequestMapping("/getOrderItem")
	@ResponseBody
	public ResponseVO getOrderItem(@RequestParam(value = "orderNo", required = false) String orderNo) {
		List<OrderItemEntity> list = orderItemService.getByOrderNo(orderNo);
		for (OrderItemEntity orderItemEntity : list) {
			System.out.println("orderItemEntity = " + orderItemEntity);
		}
		return ResponseVO.newBuilder().data(list).build();
	}

	//	修改订单状态(立即发货)

	@RequestMapping("/updateStatus")
	@ResponseBody
	public ResponseVO updateStatus(@RequestParam(value = "orderNo", required = false) String orderNo) {
		if(orderService.updateStatus(orderNo)){
			return ResponseVO.newBuilder().code("200").message("发货成功!").build();
		}
		return ResponseVO.newBuilder().code("500").message("发货失败!").build();
	}

}

