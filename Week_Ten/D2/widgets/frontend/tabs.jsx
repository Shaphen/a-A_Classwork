import React from "react";

class Tabs extends React.Component {
  constructor(props){
    super(props);
    // debugger
    this.props = props;
    this.state = {
      selectedTab: 0
    };
    this.setTab = this.setTab.bind(this);
  }

  setTab(idx) {
    this.setState({ selectedTab: idx })
  }

  render() {
    return (
      <div className="tabs">
        <h1 className="tabs-title"> Tabs </h1>
        <ul>
          {
            this.props.name.map( (tab, idx) => {
              return(
                <h1 key={idx} onClick={() => this.setTab(idx)}> { tab.title }</h1>
              )
            })
          }
        </ul>

        <article>{ this.props.name[this.state.selectedTab].content }</article>
      </div>
    )
  }
}

export default Tabs;

// setLocation3(event) {
//   this.setState({ city: event.currentTarget.innerText }, this.fetchJobListings)
// }

// render(){
//   // this.fetchJobListings("Los Angeles");
//   return (
//     <div>
//       <h1>Job Listings</h1>
//       <h2>Current City: {this.state.city}</h2>
//       <button onClick={() => this.setLocation("Los Angeles")}>Los Angeles</button>
//       <button onClick={this.setLocation2("San Francisco")}>San Francisco</button>
//       <button onClick={this.setLocation3}>New York</button>
//       <JobIndex listings={this.state.listings} />
//     </div>
//   )
// }
// }



// const JobIndex = props => {
//   return (
//     <ul>
//       {
//         props.listings.map(listing => {
//           return (<JobIndexItem
//             key={listing.id}
//             company={listing.company}
//             title={listing.title}
//             location={listing.location}
//             type={listing.type}
//           />)
//         })
//       }
//     </ul>
//   )
// };