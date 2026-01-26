<template>
    <LoadingComponent :props="loading" />
    <div class="col-12">
        <div class="db-card">
            <div class="db-card-header">
                <h3 class="db-card-title">{{ $t('order notes') }}</h3>
            </div>
            <div class="db-card-body">
                <!-- Display saved Notes if any -->
                <div v-if="form.order_notes && form.order_notes.trim()" class="mb-4 p-4 bg-blue-50 border border-blue-200 rounded-lg">
                    <h4 class="text-sm font-semibold text-blue-800 mb-2">Current Order Notes:</h4>
                    <div class="text-sm text-blue-700 whitespace-pre-wrap">{{ form.order_notes }}</div>
                </div>
                
                
                <form @submit.prevent="save">
                    <!-- Order Notes Field -->
                    <div class="form-row mb-6">
                        <div class="form-col-12">
                            <label for="order_notes" class="db-field-title">Order Notes</label>
                            
                            <!-- Notes Input Field -->
                            <textarea id="order_notes" class="db-field-control" v-model="form.order_notes" rows="5"
                                placeholder="Enter order notes"
                                :class="errors.order_notes ? 'invalid' : ''"></textarea>
                            <small class="db-field-alert" v-if="errors.order_notes">
                                {{ errors.order_notes[0] }}
                            </small>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="form-col-12">
                        <div class="flex flex-wrap gap-3 mt-6">
                            <button type="submit" class="db-btn py-2 text-white bg-primary">
                                <i class="lab lab-save"></i>
                                <span>Save</span>
                            </button>
                            <button type="button" @click="cancel" class="db-btn-outline py-2">
                                <i class="lab lab-close"></i>
                                <span>Cancel</span>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>

<script>
import LoadingComponent from "../components/LoadingComponent";
import alertService from "../../../services/alertService";

export default {
    name: "PosOrderEditComponent",
    components: {
        LoadingComponent,
    },
    data() {
        return {
            loading: {
                isActive: false
            },
            form: {
                order_notes: ""
            },
            errors: {}
        }
    },
    mounted() {
        this.show();
    },
    methods: {
        show: function () {
            this.loading.isActive = true;
            this.$store.dispatch('posOrder/show', this.$route.params.id).then((res) => {
                console.log('Full API Response:', res);
                console.log('API Response Data:', res.data);
                console.log('API Response Data Data:', res.data.data);
                console.log('Order Notes from API:', res.data.data.order_notes);
                
                // The API response is wrapped in res.data.data
                this.form.order_notes = res.data.data.order_notes || "";
                console.log('Form Order Notes:', this.form.order_notes);
                this.loading.isActive = false;
            }).catch((err) => {
                this.loading.isActive = false;
                alertService.error(err.response.data.message);
            });
        },
        save: function () {
            console.log('Saving order notes:', this.form.order_notes);
            this.loading.isActive = true;
            this.$store.dispatch('posOrder/update', {
                id: this.$route.params.id,
                form: this.form
            }).then((res) => {
                console.log('Save response:', res.data);
                this.loading.isActive = false;
                alertService.successFlip(null, this.$t('menu.pos_orders'));
                this.$router.push({ name: 'admin.pos.orders.list' });
            }).catch((err) => {
                this.loading.isActive = false;
                this.errors = err.response.data.errors;
            });
        },
        cancel: function () {
            this.$router.push({ name: 'admin.pos.orders.list' });
        }
    }
}
</script>
