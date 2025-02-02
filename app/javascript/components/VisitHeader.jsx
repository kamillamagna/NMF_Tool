import React, { Component } from 'react';
import ReactDOM from 'react-dom'
import PrimaryReasonButton from './PrimaryReasonButton'

const primaryDiagnoses = [
  'Marfan Syndrome',
  'Loeys-Dietz Syndrome',
  'Ehlers-Danlos Syndrome',
  'Beals Syndrome',
  'familial thoracic aneurysm and dissection',
  'ectopia lentis',
  'mass phenotype',
  'bicuspid aortic valve',
  'Stickler Syndrome',
  'Shprintzen-Goldberg Syndrome'
]

export default class VisitHeader extends Component {
  render() {
    const options = primaryDiagnoses.map((d, index) =>
      <PrimaryReasonButton key={index}
                           diagnosis={d}
      ></PrimaryReasonButton>
    )
    return (
      <div className="alert alert-warning alert-dismissible fade show" role="alert">
        <button type="button" className="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>Primary Diagnosis:
        <br></br>
        {options}
      </div>
    );
  }
}
