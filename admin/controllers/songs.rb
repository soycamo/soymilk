Soymilk::Admin.controllers :songs do
  get :index do
    @title = "Songs"
    @songs = Song.all
    render 'songs/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'song')
    @song = Song.new
    @song.lyrics.build
    render 'songs/new'
  end

  post :create do
    @song = Song.new(params[:song])
    if @song.save
      @title = pat(:create_title, :model => "song #{@song.id}")
      flash[:success] = pat(:create_success, :model => 'Song')
      params[:save_and_continue] ? redirect(url(:songs, :index)) : redirect(url(:songs, :edit, :id => @song.id))
    else
      @title = pat(:create_title, :model => 'song')
      flash.now[:error] = pat(:create_error, :model => 'song')
      render 'songs/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "song #{params[:id]}")
    @song = Song.find(params[:id])
    if @song
      render 'songs/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'song', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "song #{params[:id]}")
    @song = Song.find(params[:id])
    if @song
      if @song.update_attributes(params[:song])
        flash[:success] = pat(:update_success, :model => 'Song', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:songs, :index)) :
          redirect(url(:songs, :edit, :id => @song.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'song')
        render 'songs/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'song', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Songs"
    song = Song.find(params[:id])
    if song
      if song.destroy
        flash[:success] = pat(:delete_success, :model => 'Song', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'song')
      end
      redirect url(:songs, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'song', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Songs"
    unless params[:song_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'song')
      redirect(url(:songs, :index))
    end
    ids = params[:song_ids].split(',').map(&:strip)
    songs = Song.find(ids)
    
    if Song.destroy songs
    
      flash[:success] = pat(:destroy_many_success, :model => 'Songs', :ids => "#{ids.to_sentence}")
    end
    redirect url(:songs, :index)
  end
end
