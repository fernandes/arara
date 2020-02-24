// Load all the controllers within this directory and all subdirectories. 
// Controller files must be named *_controller.js.

import { Application } from "stimulus"
import { body_class_toggler_controller } from 'arara'
import { demo_dialog_controller } from 'arara'
import { mdc_ripple_controller } from 'arara'
import { mdc_chip_set_controller } from 'arara'
import { mdc_data_table_controller } from 'arara'
import { mdc_form_field_controller } from 'arara'
import { mdc_icon_toggle_controller } from 'arara'
import { mdc_linear_progress_controller } from 'arara'
import { mdc_list_controller } from 'arara'
import { mdc_menu_controller } from 'arara'
import { mdc_select_controller } from 'arara'
import { mdc_slider_controller } from 'arara'
import { mdc_snackbar_controller } from 'arara'
import { mdc_switch_controller } from 'arara'
import { mdc_tab_bar_controller } from 'arara'
import { mdc_text_field_controller } from 'arara'
import { mdc_top_app_bar_controller } from 'arara'
import { rails_chip_set_choice_controller } from 'arara'
import { rails_chip_set_filter_controller } from 'arara'
import { remote_form_controller } from 'arara'

import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("controllers", true, /_controller\.js$/)
application.load(definitionsFromContext(context))

// Arara Controller
application.register('body-class-toggler', body_class_toggler_controller)
application.register('demo-dialog', demo_dialog_controller)
application.register('mdc-ripple', mdc_ripple_controller)
application.register('mdc-chip-set', mdc_chip_set_controller)
application.register('mdc-data-table', mdc_data_table_controller)
application.register('mdc-form-field', mdc_form_field_controller)
application.register('mdc-icon-toggle', mdc_icon_toggle_controller)
application.register('mdc-linear-progress', mdc_linear_progress_controller)
application.register('mdc-list', mdc_list_controller)
application.register('mdc-menu', mdc_menu_controller)
application.register('mdc-select', mdc_select_controller)
application.register('mdc-slider', mdc_slider_controller)
application.register('mdc-snackbar', mdc_snackbar_controller)
application.register('mdc-switch', mdc_switch_controller)
application.register('mdc-tab-bar', mdc_tab_bar_controller)
application.register('mdc-text-field', mdc_text_field_controller)
application.register('mdc-top-app-bar', mdc_top_app_bar_controller)
application.register('rails-chip-set-filter', rails_chip_set_choice_controller)
application.register('rails-chip-set-choice', rails_chip_set_filter_controller)
application.register('remote-form', remote_form_controller)
