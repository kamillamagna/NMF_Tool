# require 'rails_helper'
# require 'pry'
# # This spec was generated by rspec-rails when you ran the scaffold generator.
# # It demonstrates how one might use RSpec to specify the controller code that
# # was generated by Rails when you ran the scaffold generator.
# #
# # It assumes that the implementation code is generated by the rails scaffold
# # generator.  If you are using any extension libraries to generate different
# # controller code, this generated spec may or may not pass.
# #
# # It only uses APIs available in rails and/or rspec-rails.  There are a number
# # of tools you can use to make these specs even more expressive, but we're
# # sticking to rails and rspec-rails APIs to keep things simple and stable.
# #
# # Compared to earlier versions of this generator, there is very limited use of
# # stubs and message expectations in this spec.  Stubs are only used when there
# # is no simpler way to get a handle on the object needed for the example.
# # Message expectations are only used when there is no simpler way to specify
# # that an instance is receiving a specific message.
#
# RSpec.describe VisitsController, type: :controller do
#   let!(:patient) { FactoryGirl.create(:patient) }
#   let!(:clinician) { FactoryGirl.create(:clinician) }
#
#   let!(:visit) { FactoryGirl.create(:visit, patient: patient, clinician: clinician) }
#   render_views
#   # This should return the minimal set of values that should be in the session
#   # in order to pass any filters (e.g. authentication) defined in
#   # VisitsController. Be sure to keep this updated too.
#
#   let(:valid_attributes) {
#     FactoryGirl.attributes_for(:visit)
#   }
#
#   let(:invalid_attributes) {
#     FactoryGirl.attributes_for(:visit, patient_id: nil)
#   }
#
#   let(:valid_session) { {} }
#
#   describe "GET #index" do
#     it "assigns all visits as @visits" do
#       get :index, {}, valid_session
#       expect(assigns(:visits)).to include(visit)
#     end
#   end
#
#   describe "GET #show" do
#     before { self.instance_variable_set(:@visit, visit) }
#     before { self.instance_variable_set(:@patient, patient) }
#     before { self.instance_variable_set(:@clinician, clinician) }
#     it "assigns the requested visit as @visit" do
#       get :show, {:id => visit.to_param}, valid_session
#       expect(assigns(:visit)).to eq(visit)
#     end
#   end
#
#   describe "GET #new" do
#     it "assigns a new visit as @visit" do
#       get :new, {}, valid_session
#       expect(assigns(:visit)).to be_a_new(Visit)
#     end
#   end
#
#   describe "GET #edit" do
#     it "assigns the requested visit as @visit" do
#       get :edit, {:id => visit.to_param}, valid_session
#       expect(assigns(:visit)).to eq(visit)
#     end
#   end
#
#   describe "POST #create" do
#     context "with valid params" do
#       it "creates a new Visit" do
#         expect {
#           post :create, {:visit => FactoryGirl.attributes_for(:visit, patient: visit.patient, clinician: visit.clinician)}, valid_session
#         }.to change(Visit, :count).by(1)
#       end
#
#       it "assigns a newly created visit as @visit" do
#         post :create, {:visit => valid_attributes}, valid_session
#         expect(assigns(:visit)).to be_a(Visit)
#         expect(assigns(:visit)).to be_persisted
#       end
#
#       it "redirects to the created visit" do
#         post :create, {:visit => valid_attributes}, valid_session
#         expect(response).to redirect_to(Visit.last)
#       end
#     end
#
#     context "with invalid params" do
#       it "assigns a newly created but unsaved visit as @visit" do
#         post :create, {:visit => invalid_attributes}, valid_session
#         expect(assigns(:visit)).to be_a_new(Visit)
#       end
#
#       it "re-renders the 'new' template" do
#         post :create, {:visit => invalid_attributes}, valid_session
#         expect(response).to render_template("new")
#       end
#     end
#   end
#
#   describe "PUT #update" do
#     context "with valid params" do
#       let(:new_attributes) {
#         skip("Add a hash of attributes valid for your model")
#       }
#
#       it "updates the requested visit" do
#         put :update, {:id => visit.to_param, :visit => new_attributes}, valid_session
#         visit.reload
#         skip("Add assertions for updated state")
#       end
#
#       it "assigns the requested visit as @visit" do
#         put :update, {:id => visit.to_param, :visit => valid_attributes}, valid_session
#         expect(assigns(:visit)).to eq(visit)
#       end
#
#       it "redirects to the visit" do
#         put :update, {:id => visit.to_param, :visit => valid_attributes}, valid_session
#         expect(response).to redirect_to(visit)
#       end
#     end
#
#     context "with invalid params" do
#       it "assigns the visit as @visit" do
#         put :update, {:id => visit.to_param, :visit => invalid_attributes}, valid_session
#         expect(assigns(:visit)).to eq(visit)
#       end
#
#       it "re-renders the 'edit' template" do
#         put :update, {:id => visit.to_param, :visit => invalid_attributes}, valid_session
#         expect(response).to render_template("edit")
#       end
#     end
#   end
#
#   describe "DELETE #destroy" do
#     it "destroys the requested visit" do
#       expect {
#         delete :destroy, {:id => visit.to_param}, valid_session
#       }.to change(Visit, :count).by(-1)
#     end
#
#     it "redirects to the visits list" do
#       delete :destroy, {:id => visit.to_param}, valid_session
#       expect(response).to redirect_to(visits_url)
#     end
#   end
#
# end