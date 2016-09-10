class RecordsController < ApplicationController
	before_action :set_entity, only: [:update, :destroy]

	def index
		@records = Record.all
	end

	def create
		@record = Record.new(record_params)
		if @record.save
			render json: @record
		else
			render json: @record.error, status: :unprocessable_entity
		end
	end

	def update
		if @record.update_attributes(record_params)
			render json: @record
		else
			render json: @record.error, status: :unprocessable_entity
		end
	end

	def destroy
		@record.destroy
		head :no_content
	end

	private
		def record_params
			params.require(:record).permit(:title, :amount, :date)
		end

		def set_entity
			@record = Record.find(params[:id])
		end
end
