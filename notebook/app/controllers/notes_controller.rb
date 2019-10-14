class NotesController < ApplicationController

    def index
        @notes = Notes.all
    end

    def show
        @notes = Notes.find(params[:id])
    end

    def new
        @notes = Notes.new
    end

    def edit
        @notes = Notes.find(params[:id])
    end

    def create
        @notes = Notes.new(notes_params)
        if @notes.save
            redirect_to @notes
        else
            render 'new'
        end
    end

    def update
        @notes = Notes.find(params[:id])
       
        if @notes.update(notes_params)
          redirect_to @note
        else
          render 'edit'
        end
    end

    def destroy
        @notes = Notes.find(params[:id])
        @notes.destroy
        redirect_to notes_path
    end

    private
        def notes_params
            params.require(:notes).permit(:title, :text)
        end

end
