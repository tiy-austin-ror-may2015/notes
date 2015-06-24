/* globals React, moment */
'use strict';
var PostTime = React.createClass({
  getInitialState: function () {
    return {
        hover: false
    };
  },
  render: function () {
    var timestamp;
    if (this.state.hover) {
        timestamp = moment(this.props.time).format('LL');
    } else {
        timestamp = moment(this.props.time).fromNow();
    }
    return (
        <div onMouseOver={this.mouseOver}
             onMouseOut={this.mouseOut}
             className='help-block'> {timestamp} </div>
    );
  },
  mouseOver: function () {
        this.setState({ hover: true});
  },
  mouseOut: function() {
        this.setState({ hover: false});
  }
});

var Post = React.createClass({
    render: function () {
        return (
            <article>
                <header>
                    <h3><a href={this.props.url}>{this.props.title}</a></h3>
                    <PostTime time={this.props.createdAt} />
                    <FavoriteButton />
                </header>
                <PostBody body={this.props.body}/>
           </article>
        );
    },
});

var PostBody = React.createClass({
    getInitialState: function () {
        return { isOpen: false };
    },

    render: function () {
        if (this.state.isOpen) {
            return this.expanded();
        } else {
            return this.collapsed();
        }
    },

    expanded: function () {
        return (<span>{this.props.body}
            <a onClick={this.collapseBody}>Collapse</a></span>);
    },

    collapsed: function () {
        return (<span>{this.props.body.substring(0, 100)}...
            <a onClick={this.expandBody}>Expand</a></span>);
    },

    expandBody: function () {
        this.setState({ isOpen: true });
    },

    collapseBody: function () {
        this.setState({ isOpen: false });
    }
});
