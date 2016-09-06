module Spree
  class AuctionForegiftsController < StoreController
    before_action :load_object, only: [ :prepare ]
    before_action :set_auction_foregift, only: [:show, :edit, :update, :destroy]

    def prepare
      @auction_foregift = AuctionForegift.find_or_initialize_by( user: @user, auction:  @auction, amount: @auction.deposit )
      @auction_foregift.attributes = auction_foregift_params
      @auction_foregift.save!
      redirect_to aplipay_full_service_url( @auction_foregift )
    end
    # GET /auction_foregifts
    # GET /auction_foregifts.json
    def index
      @auction_foregifts = AuctionForegift.all
    end

    # GET /auction_foregifts/1
    # GET /auction_foregifts/1.json
    def show
    end

    # GET /auction_foregifts/new
    def new
      @auction_foregift = AuctionForegift.new
    end

    # GET /auction_foregifts/1/edit
    def edit
    end

    # POST /auction_foregifts
    # POST /auction_foregifts.json
    def create
      @auction_foregift = AuctionForegift.new(auction_foregift_params)

      respond_to do |format|
        if @auction_foregift.save
          format.html { redirect_to @auction_foregift, notice: 'Auction foregift was successfully created.' }
          format.json { render :show, status: :created, location: @auction_foregift }
        else
          format.html { render :new }
          format.json { render json: @auction_foregift.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /auction_foregifts/1
    # PATCH/PUT /auction_foregifts/1.json
    def update
      respond_to do |format|
        if @auction_foregift.update(auction_foregift_params)
          format.html { redirect_to @auction_foregift, notice: 'Auction foregift was successfully updated.' }
          format.json { render :show, status: :ok, location: @auction_foregift }
        else
          format.html { render :edit }
          format.json { render json: @auction_foregift.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /auction_foregifts/1
    # DELETE /auction_foregifts/1.json
    def destroy
      @auction_foregift.destroy
      respond_to do |format|
        format.html { redirect_to auction_foregifts_url, notice: 'Auction foregift was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_auction_foregift
        @auction_foregift = AuctionForegift.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def auction_foregift_params
        params.require(:auction_foregift).permit(:auction_id, :payment_method_id, :state, :amount)
      end

      def load_object
        @auction = Auction.friendly.find( params[:auction_id] )
        @user ||= spree_current_user
        authorize! params[:action].to_sym, @user
      end

      def aplipay_full_service_url( auction_foregift )
        alipay = Gateway::AlipayWap.first

        title = auction_foregift.auction.title

        #service partner _input_charset out_trade_no subject payment_type logistics_type logistics_fee logistics_payment seller_email price quantity
        options = { #:_input_charset => "utf-8",
                    :out_trade_no => auction_foregift.number,
                    #:price => order.item_total,
                    #:quantity => 1,
                    #:logistics_type=> 'EXPRESS',
                    #:logistics_fee => order.shipments.to_a.sum(&:cost),
                    #:logistics_payment=>'BUYER_PAY',
                    #:seller_id => alipay.preferred_alipay_pid,
                    :notify_url => url_for(:only_path => false, :controller=>'alipay_status', :action => 'alipay_notify'),
                    :return_url => url_for(:only_path => false, :controller=>'alipay_status', :action => 'alipay_done'),
                    :body => title.truncate(500),  #char 1000
                    #:payment_type => 1,
                    :subject => title.truncate(128) #char 256
           }
        alipay.provider.url( auction_foregift, options )
      end

  end
end
