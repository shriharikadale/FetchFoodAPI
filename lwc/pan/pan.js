import { LightningElement, api } from 'lwc';
import getFields from '@salesforce/apex/House.getFields';

export default class DynamicRecordEditForm extends LightningElement {
    Click = 'Click here';
    @api recordId;
    Display = []; // Array to store the Display 
    isviviable = false;

    connectedCallback() {
        // Call Apex method to get the fields from FieldSet
        getFields()
            .then((result) => {
                this.Display = result;
                console.log('this.Display :'+JSON.stringify(this.Display));
            })
            .catch((error) => {
                console.error(error);
            });
    }

    handleclick(event){
        const Click = event.target.label;

        if(Click === 'Click here'){
            this.isviviable = true;
            this.Click = 'Close';
        }else{
            this.Click = 'Click here';
            this.isviviable = false;
        }
       
    
    }
}