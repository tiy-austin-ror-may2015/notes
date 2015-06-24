'use strict';

var PostList = React.createClass({
    getInitialState: function () {
        return {
            page: 0,
            posts: this.props.posts
        };
    },
    render: function () {
        return (
            <div className='row'>
                  <div className='col-sm-8 col-sm-offset-2'>
                      {this.renderPosts()}
                  </div>
                  <div onClick={this.prev} className='btn btn-default'>Prev Page</div>
                  <div onClick={this.next} className='btn btn-default'>Next Page</div>
            </div>
        );
    },
    renderPosts: function () {
      var posts = this.state.posts;
      return posts.map(function (post) {
        return <Post id={post.id} url={post.url} title={post.title} createdAt={post.created_at} body={post.body} />;
      });
    },
    prev: function () {
        jQuery.getJSON('/posts?page=' + (this.state.page - 1), function (data) {
            this.setState({ posts: data,
                             page: this.state.page - 1 });
        }.bind(this));
    },
    next: function () {
        jQuery.getJSON('/posts?page=' + (this.state.page + 1), function (data) {
            this.setState({ posts: data,
                             page: this.state.page + 1 });
        }.bind(this));
    }
});
