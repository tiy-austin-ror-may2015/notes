/* globals React */
var HelloWorld = React.createClass({
    render: function () {
        return (
            <h1>Hello World</h1>
        );
    }
});






















// React Component with State
// Everytime a component's state changes,
// react with automatically call render to change the way it is displayed
var FavoriteButton = React.createClass({
    getInitialState: function () {
        return {
            isFavorite: false
        };
    },

    render: function () {
        if (this.state.isFavorite) {
          return (
            <div>
              <div className='btn btn-xs btn-primary' onClick={this.handleClick}>Remove As Favorite</div>
              <span>Favorite!</span>
            </div>
          );
        } else {
          return (
            <div className='btn btn-xs btn-primary' onClick={this.handleClick}>Mark As Favorite</div>
          );
        }
    },

    handleClick: function () {
      if (this.state.isFavorite) {
        this.setState({ isFavorite: false });
      } else {
        this.setState({ isFavorite: true });
      }
    }
});
