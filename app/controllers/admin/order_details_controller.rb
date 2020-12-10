class Admin::OrderDetailsController < ApplicationController
  def update
    order_detail = OrderDetail.find(params[:id])
    order_details = order_detail.order.order_details
    order_detail.update(order_detail_params)

    if order_detail.maiking_status_before_type_cast == 2
      order_detail.order.update(status: "maiking")
    end

    # @order_details.each do |order_detail|
    #   if order_detail.maiking_status_before_type_cast == 3
    #     order_detail.order.update(order_status: 3)
    #     redirect_to admin_order_path(order_detail.order_id)
    #   end
    # end
    #   注文商品を全て取り出す
    #   製作ステータスが全て製作完了かを確認する
    #   全て製作完了であれば注文ステータスを3にする

    check = 0
    order_details.each do |order_detail|
      if order_detail.maiking_status_before_type_cast == 3
        check += 1
      end
    end
      # 注文商品の数 ＝ 製作完了である数
    if order_details.length == check
      order_detail.order.update(status: "preparation")
    end
    redirect_to admin_order_path(order_detail.order_id)
  end

#      isTrue = false
# 　   @order_details.each do |order_detail|
#      if order_detail.maiking_status_before_type_cast == 3
#        isTrue = true
#      else
#        isTrue = false
#       break
#       end
#      end
#      if isTrue
#       order_detail.order.update(order_status: 3)
#       redirect_to admin_order_path(order_detail.order_id)
#      end
#   end

 private
    def order_detail_params
      params.require(:order_detail).permit(:maiking_status)
    end
end


