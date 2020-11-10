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
  }

  beforeReflex(element, reflex, noop, reflexId) {
    // document.body.classList.add('wait')
  }

  reflexSuccess(element, reflex, noop, reflexId) {
    // show success message etc...
  }

  reflexError(element, reflex, error, reflexId) {
    // show error message etc...
  }

  afterReflex(element, reflex, noop, reflexId) {
    // document.body.classList.remove('wait')
  }
}
