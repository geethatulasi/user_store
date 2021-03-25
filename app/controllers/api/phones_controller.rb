class Api::PhonesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    if params[:number]
      old_number = Phone.where(special:false).order(created_at: :desc).pluck(:number).first
      if old_number.present?
        new_number = old_number.succ
      else
        new_number = "1111111111"
      end
      number = Phone.find_by(number:params[:number])
      if number.present?
        if(number.alloted==true)
          phone = Phone.new(number:new_number,alloted:true,special:false)
          if phone.save
            render json:phone,message: "alloted normal number"
          else
            render json:{message:"Unable to allot normal number",errors:phone.errors}
          end
        else
          phone = number
          if phone.update(alloted:true,special:true)
            render json: phone,message: "alloted special number"
          else
            render json: {message:"Unable to allot special number",errors:phone.errors}
          end
        end
      else
        phone = Phone.new(number:params[:number],alloted:true,special:true)
        if phone.save
          render json: phone, message: "special number alloted"
        else
          render json: {message: "Unable to allot special number",errors: phone.errors}
        end
      end
    else
      old_number = Phone.where(special:false).order(created_at: :desc).pluck(:number).first
      if old_number.present?
        new_number = old_number.succ
      else
        new_number = "1111111111"
      end
      number = Phone.find_by(number:new_number)
      if number.present?
        if(number.alloted == true)
          phone = Phone.new(number:new_number.succ,alloted:true,special:false)
          if phone.save
            render json: phone
          else
            render json: {message: "Unable to allot normal number",errors:phone.errors}
          end
        else
          if phone.update(alloted:true)
          render json: phone
          else
            render json: {message: "Unable to allot normal number",errors:phone.errors}
          end
        end
      else
        phone = Phone.new(number:new_number,alloted:true,special:false)
        if phone.save
            render json: phone
        else
          render json: {message: "Unable to allot normal number",errors:phone.errors}
        end
      end
    end
  end

  private
  def phone_params
    params.require(:phone).permit(:number,:alloted,:special)
  end

end
