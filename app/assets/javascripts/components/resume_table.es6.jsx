class ResumeTable extends React.Component{
    constructor(props){
        super(props)
        this.state = { vitaes: [], nextPage: null }
    }

    componentWillMount(){
        this.fetchResume()
    }

    render(){
        return(
            <div className="panel-body">    
                <table className="table table-hover">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Status</th>
                            <th>Education Attainment</th>
                        </tr>                   
                    </thead>
                    {this.renderTableData()}
                </table>
                {this.loadMoreButton()}
            </div>
        )
    }

    fetchResume(){
        $.ajax({
            url: `/api/people/`,
            method: "GET",
            dataType: "JSON",
            success: (data) => {
                this.setState({
                    vitaes: data.vitaes,
                    nextPage: data.next_page
                })
            }
        })
    }

    renderTableData(){
        return(
            this.state.vitaes.map ((resume) => 
                <tbody key={resume.id}>
                    <tr className="resume-row">
                        <td><a href={`/people/${resume.id}`}>{resume.last_name}, {resume.first_name}</a></td>
                        <td>{resume.resume_status}</td>
                        <td>{resume.education_status}</td>
                        <td><a className="glyphicon glyphicon-edit" href={`/people/${resume.id}/edit`}></a></td>                            
                        <td><a 
                            className="glyphicon glyphicon-trash red" 
                            data-method="delete"
                            href={`/people/${resume.id}`} 
                            ></a>
                        </td>
                    </tr>    
                </tbody>            
            )
        )
    }

    loadMoreButton() {
        if (this.state.nextPage === null) {
            return;
        }
        return (
            <ul >
                <li>
                    <a className="see-more-table" onClick={() => this.handleLoadMore()}>See More
                        <i className={`fa ${this.fetching ? 'fa-spinnerfa-pulse': ''}`}></i>
                    </a>
                </li>
            </ul>
        );
    }

    handleLoadMore() {
        if (this.fetching || !this.state.nextPage) { return; }
        this.fetching = true;
        $.ajax({
            url: `/api/people.json/?page=${this.state.nextPage}`,
            method: 'GET',
            dataType: 'json',
            success: (data) => {
                this.fetching = false;
                this.setState({
                    nextPage: data.next_page,
                    vitaes: [ ...this.state.vitaes, ...data.vitaes ]
                });
            }
        });
    }

}