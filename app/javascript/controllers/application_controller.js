import { Controller } from 'stimulus'
import StimulusReflex from 'stimulus_reflex'

/* This is your ApplicationController.
 * All StimulusReflex controllers should inherit from this class.
 *
 * Example:
 *
 *   import ApplicationController from './application_controller'
 *
 *   export default class extends ApplicationController { ... }
 *
 * Learn more at: https://docs.stimulusreflex.com
 */
export default class extends Controller {

  connect() {
    StimulusReflex.register(this)
    this.errorExplanation = document.getElementById("error-explanation");
    this.successMessage = document.getElementById("success-message");
  }

  beforeReflex(element, reflex, noop, reflexId) {
    if (this.successMessage !== undefined) {
      this.successMessage.style.display = "none";
    }
  }

  reflexSuccess(element, reflex, noop, reflexId) {
    if (this.successMessage !== undefined && this.errorExplanation !== undefined) {
      this.successMessage.style.display = "block";
    }
  }

  reflexError(element, reflex, error, reflexId) {
    if (this.successMessage !== undefined) {
      this.successMessage.style.display = "none";
    }
  }

  afterReflex(element, reflex, noop, reflexId) {
  }
}
