class MeetingsController < ApplicationController

      def show
        @meeting = Meeting.find(params[:id])
      end
    
      def index
        @meeting = Meeting.all
   
      end
    
      def edit
        @meeting = Meeting.find(params[:id])
      end
    
      def create
        @meeting = Meeting.new(params.require(:meeting).permit(:name, :role, :email, :description, :date, :start_at, :end_at, :roomtype ))
       
        if @meeting.save
          flash[:notice] = "Meeting was created successfully."
          redirect_to meetings_path
        else
            render 'new'
        end
   
      end
    
      def update
        @meeting = Meeting.find(params[:id])
        if @meeting.update(params.require(:meeting).permit(:name, :role, :email, :description, :date, :start_at, :end_at, :roomtype ))
          flash[:notice] = "Meeting Schedule was updated successfully."
          redirect_to meetings_path
        else
            render 'edit'
        end
      end
    
      def destroy
        @meeting = Meeting.find(params[:id])
        @meeting.destroy
        redirect_to meetings_path
      end

end
