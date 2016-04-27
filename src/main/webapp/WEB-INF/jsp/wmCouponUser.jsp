<%@ page contentType="text/html;charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<html>
    <head>
        <title>cg-project</title>
        <link rel="stylesheet" href="/assets/css/import.css" type="text/css" />
        <script src="/assets/js/jquery-1.9.1.js" type="text/javascript"></script>
        <script src="/assets/js/bootstrap.js" type="text/javascript"></script>
        <script type="text/javascript">
           var item = "wmCouponUser";
        </script>
        <script src="/assets/js/cg-form.js" type="text/javascript"></script>
    </head>
    <body>
        <section class="form-section">
            <h4 class="new-update-title" >New/Update</h4>
			<form class="cg-form form-horizontal" action="wmCouponUser/create" data-update="wmCouponUser/update" data-delete="wmCouponUser/delete">
			  <input type="hidden" value="" id="update-id" name="id"/>
				<div class="control-group">
					<label class="control-label" for="code">code</label>
					<div class="controls">
						<input type="text" id="code" name="code"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="wm_coupon_marketing_id">wm_coupon_marketing_id</label>
					<div class="controls">
						<input type="text" id="wm_coupon_marketing_id" name="wm_coupon_marketing_id"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="wm_act_policy_id">wm_act_policy_id</label>
					<div class="controls">
						<input type="text" id="wm_act_policy_id" name="wm_act_policy_id"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="source">source</label>
					<div class="controls">
						<input type="text" id="source" name="source"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="source_type">source_type</label>
					<div class="controls">
						<input type="text" id="source_type" name="source_type"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="coupon_type">coupon_type</label>
					<div class="controls">
						<input type="text" id="coupon_type" name="coupon_type"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="coupon_price">coupon_price</label>
					<div class="controls">
						<input type="text" id="coupon_price" name="coupon_price"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="user_id">user_id</label>
					<div class="controls">
						<input type="text" id="user_id" name="user_id"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="bind_phone">bind_phone</label>
					<div class="controls">
						<input type="text" id="bind_phone" name="bind_phone"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="use_phone">use_phone</label>
					<div class="controls">
						<input type="text" id="use_phone" name="use_phone"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="end_time">end_time</label>
					<div class="controls">
						<input type="text" id="end_time" name="end_time"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="coupon_status">coupon_status</label>
					<div class="controls">
						<input type="text" id="coupon_status" name="coupon_status"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="ctime">ctime</label>
					<div class="controls">
						<input type="text" id="ctime" name="ctime"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="utime">utime</label>
					<div class="controls">
						<input type="text" id="utime" name="utime"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="use_limit">use_limit</label>
					<div class="controls">
						<input type="text" id="use_limit" name="use_limit"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="use_order_id">use_order_id</label>
					<div class="controls">
						<input type="text" id="use_order_id" name="use_order_id"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="full_price">full_price</label>
					<div class="controls">
						<input type="text" id="full_price" name="full_price"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="price_limit">price_limit</label>
					<div class="controls">
						<input type="text" id="price_limit" name="price_limit"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="limits">limits</label>
					<div class="controls">
						<input type="text" id="limits" name="limits"/>
					</div>
				</div>

			  <div class="control-group">
			    <div class="controls">
			    	<a href="#" class="btn save-btn">Save</a>
                    <a href="#" class="btn cancel-btn">Cancel</a>
               </div>
			   </div>
			</form>
       
        </section>

        <div class="announce-area">
            <table class="cg-table table table-striped" >
                <thead>
                    <tr>
					<th>code</th>
					<th>wm_coupon_marketing_id</th>
					<th>wm_act_policy_id</th>
					<th>source</th>
					<th>source_type</th>
					<th>coupon_type</th>
					<th>coupon_price</th>
					<th>user_id</th>
					<th>bind_phone</th>
					<th>use_phone</th>
					<th>end_time</th>
					<th>coupon_status</th>
					<th>ctime</th>
					<th>utime</th>
					<th>use_limit</th>
					<th>use_order_id</th>
					<th>full_price</th>
					<th>price_limit</th>
					<th>limits</th>

                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="item">
					<tr>
				        <td  class="item-id">${item.id}</td>
						<td class="code">${item.code}</td>
						<td class="wm_coupon_marketing_id">${item.wm_coupon_marketing_id}</td>
						<td class="wm_act_policy_id">${item.wm_act_policy_id}</td>
						<td class="source">${item.source}</td>
						<td class="source_type">${item.source_type}</td>
						<td class="coupon_type">${item.coupon_type}</td>
						<td class="coupon_price">${item.coupon_price}</td>
						<td class="user_id">${item.user_id}</td>
						<td class="bind_phone">${item.bind_phone}</td>
						<td class="use_phone">${item.use_phone}</td>
						<td class="end_time">${item.end_time}</td>
						<td class="coupon_status">${item.coupon_status}</td>
						<td class="ctime">${item.ctime}</td>
						<td class="utime">${item.utime}</td>
						<td class="use_limit">${item.use_limit}</td>
						<td class="use_order_id">${item.use_order_id}</td>
						<td class="full_price">${item.full_price}</td>
						<td class="price_limit">${item.price_limit}</td>
						<td class="limits">${item.limits}</td>

				        <td>
				            <ul class="actions">
				                <li><a class="modify" href="#">Modify</a></li>
				                <li><a class="delete" href="#">Delete</a></li>
				            </ul>
				        </td>
				    </tr>
                </c:forEach>    
                </tbody>
            </table>
        </div>
    </body>
</html>