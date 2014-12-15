class IngsController < ApplicationController
  before_action :set_ing, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:new, :edit, :create, :update, :destroy]

  # GET /ings
  # GET /ings.json
  def index
    @ing = Ing.new
    @ings = Ing.paginate(page: params[:page])
  end

  # GET /ings/1
  # GET /ings/1.json
  def show
  end

  # GET /ings/1/edit
  def edit
  end

  # POST /ings
  # POST /ings.json
  def  create
    @ing = current_user.ings.build(ing_params)
    respond_to do |format|
      if @ing.save
        format.html { redirect_to @ing, notice: 'Ing was successfully created.'}
        format.json { render action: 'show', status: :created, location: @ing }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @ing.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /ing/1
  def update
    respond_to do |format|
      if @ing.update(ing_params)
        format.html { redirect_to @ing, notice: 'Ing was successfully created.'}
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ings/1
  # DELETE /ings/1.json
  def destroy
    @ing.destroy
    respond_to do |format|
      format.html { redirect_to ings_url }
      format.json { head :no_content }
    end
  end

  private
    def set_ing
      @ing = Ing.find(params[:id])
    end

    def ing_params
      params.require(:ing).permit(:content)
    end
end
