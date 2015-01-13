class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  # GET /tests
  # GET /tests.json
  def index
    @tests =
        case params[:type]
          when 'my'
            @old_count = Test.old_tests(@current_user.id).count
            Test.where('user_id = ?', @current_user.id).order('updated_at DESC').page(params[:page])
          when 'old'
            Test.old_tests(@current_user.id).order('updated_at DESC').page(params[:page])
          else
            Test.all.order('updated_at DESC').page(params[:page])
        end
  end


  # GET /tests/1
  # GET /tests/1.json
  def show
      @test=Test.find(params[:id])
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @tests = Test.new(test_params)
    if @tests.save
      redirect_to @tests, notice: 'Тест создан'
    else
      render :new
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Тест изменен.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Тест удален.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:name, :content, :cover, :topic_id)
    end

end
