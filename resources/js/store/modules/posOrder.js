import axios from 'axios'
import appService from "../../services/appService";


export const posOrder = {
    namespaced: true,
    state: {
        lists: [],
        page: {},
        pagination: [],
        show: {},
        orderItems: {},
        orderBranch: {},
        orderUser: {},
        temp: {
            temp_id: null,
            isEditing: false,
        },
    },
    getters: {
        lists: function (state) {
            return state.lists;
        },

        pagination: function (state) {
            return state.pagination
        },
        page: function(state) {
            return state.page;
        },
        show: function (state) {
            return state.show;
        },
        orderItems: function (state) {
            return state.orderItems;
        },
        orderBranch: function (state) {
            return state.orderBranch;
        },
        orderUser: function (state) {
            return state.orderUser;
        },
        temp: function (state) {
            return state.temp;
        }
    },
    actions: {
        lists: function (context, payload) {
            return new Promise((resolve, reject) => {
                let url = 'admin/pos-order';
                if (payload) {
                    url = url + appService.requestHandler(payload);
                }
                axios.get(url).then((res) => {
                    if(typeof payload.vuex === "undefined" || payload.vuex === true) {
                        context.commit('lists', res.data.data);
                        context.commit('page', res.data.meta);
                        context.commit('pagination', res.data);
                    }

                    resolve(res);
                }).catch((err) => {
                    reject(err);
                });
            });
        },
        save: function (context, payload) {
            return new Promise((resolve, reject) => {
                // Ensure dining_table_id is properly handled
                if (payload.dining_table_id === 'null' || payload.dining_table_id === '' || payload.dining_table_id === 0) {
                    payload.dining_table_id = null;
                }
                
                // Ensure pos_payment_note is properly handled
                if (payload.pos_payment_note === 'null' || payload.pos_payment_note === '') {
                    payload.pos_payment_note = null;
                }
                
                // Ensure pos_received_amount is properly handled
                if (payload.pos_received_amount === 'null' || payload.pos_received_amount === '') {
                    payload.pos_received_amount = null;
                }
                
                // Check if any items have attachments using a different approach
                const items = JSON.parse(payload.items);
                console.log('Items from payload:', items);
                
                // Get files from sessionStorage (stored separately from cart)
                const storedFiles = JSON.parse(sessionStorage.getItem('pos_attachments') || '{}');
                const hasAttachments = Object.keys(storedFiles).length > 0;
                console.log('Stored files:', storedFiles);
                console.log('Has attachments:', hasAttachments);
                
                if (hasAttachments) {
                    // Use FormData for file uploads
                    const formData = new FormData();
                    
                    // Add all form fields
                    Object.keys(payload).forEach(key => {
                        if (key === 'items') {
                            // Handle items separately for file uploads
                            const itemsWithoutFiles = items.map(item => {
                                const { attachment, ...itemWithoutFile } = item;
                                return itemWithoutFile;
                            });
                            formData.append('items', JSON.stringify(itemsWithoutFiles));
                        } else {
                            formData.append(key, payload[key]);
                        }
                    });
                    
                    // Add files from sessionStorage
                    Object.keys(storedFiles).forEach((itemId, index) => {
                        const fileData = storedFiles[itemId];
                        if (fileData && fileData.file) {
                            // Convert base64 back to file
                            const byteCharacters = atob(fileData.file.split(',')[1]);
                            const byteNumbers = new Array(byteCharacters.length);
                            for (let i = 0; i < byteCharacters.length; i++) {
                                byteNumbers[i] = byteCharacters.charCodeAt(i);
                            }
                            const byteArray = new Uint8Array(byteNumbers);
                            const file = new File([byteArray], fileData.name, { type: fileData.type });
                            
                            console.log(`Adding attachment for item ${index}:`, file);
                            formData.append(`attachments[${index}]`, file);
                        }
                    });
                    
                    console.log('FormData entries:');
                    for (let [key, value] of formData.entries()) {
                        console.log(key, value);
                    }
                    
                    axios.post("admin/pos", formData, {
                        headers: {
                            'Content-Type': 'multipart/form-data'
                        }
                    }).then((res) => {
                        // Clear sessionStorage after successful order
                        sessionStorage.removeItem('pos_attachments');
                        console.log('Order completed, sessionStorage cleared');
                        resolve(res);
                    }).catch((err) => {
                        reject(err);
                    });
                } else {
                    // Use regular JSON for orders without attachments
                    console.log('No attachments found, sending as JSON');
                    axios.post("admin/pos", payload).then((res) => {
                        // Clear sessionStorage after successful order
                        sessionStorage.removeItem('pos_attachments');
                        console.log('Order completed, sessionStorage cleared');
                        resolve(res);
                    }).catch((err) => {
                        reject(err);
                    });
                }
            });
        },
        show: function (context, payload) {
            return new Promise((resolve, reject) => {
                axios.get(`admin/pos-order/show/${payload}`).then((res) => {
                    context.commit('show', res.data.data);
                    context.commit("orderItems", res.data.data.order_items);
                    context.commit("orderBranch", res.data.data.branch);
                    context.commit("orderUser", res.data.data.user);
                    resolve(res);
                }).catch((err) => {
                    reject(err);
                });
            });
        },
        destroy: function (context, payload) {
            return new Promise((resolve, reject) => {
                axios.delete(`admin/pos-order/${payload.id}`).then((res) => {
                    context.dispatch('lists', payload.search).then().catch();
                    resolve(res);
                }).catch((err) => {
                    reject(err);
                });
            });
        },
        changeStatus: function (context, payload) {
            return new Promise((resolve, reject) => {
                axios.post(`admin/pos-order/change-status/${payload.id}`,payload).then((res) => {
                    context.commit('show', res.data.data);
                    resolve(res);
                }).catch((err) => {
                    reject(err);
                });
            });
        },
        changePaymentStatus: function (context, payload) {
            return new Promise((resolve, reject) => {
                axios.post(`admin/pos-order/change-payment-status/${payload.id}`,payload).then((res) => {
                    context.commit('show', res.data.data);
                    resolve(res);
                }).catch((err) => {
                    reject(err);
                });
            });
        },
        update: function (context, payload) {
            return new Promise((resolve, reject) => {
                axios.put(`admin/pos-order/${payload.id}`, payload.form).then((res) => {
                    context.commit('show', res.data.data);
                    resolve(res);
                }).catch((err) => {
                    reject(err);
                });
            });
        },
        reset: function (context) {
            context.commit('reset');
        },
        export: function (context, payload) {
            return new Promise((resolve, reject) => {
                let url = 'admin/pos-order/export';
                if (payload) {
                    url = url + appService.requestHandler(payload);
                }
                axios.get(url, {responseType: 'blob'}).then((res) => {
                    resolve(res);
                }).catch((err) => {
                    reject(err);
                });
            });
        },
        saveCustomer: function (context, payload) {
            return new Promise((resolve, reject) => {
                let method = axios.post;
                let url = "/admin/pos/customer";
                method(url, payload.form)
                    .then((res) => {
                        resolve(res);
                    })
                    .catch((err) => {
                        reject(err);
                    });
            });
        },
    },
    mutations: {
        lists: function (state, payload) {
            state.lists = payload
        },
        pagination: function (state, payload) {
            state.pagination = payload;
        },
        page: function (state, payload) {
            if(typeof payload !== "undefined" && payload !== null) {
                state.page = {
                    from: payload.from,
                    to: payload.to,
                    total: payload.total
                }
            }
        },
        show: function (state, payload) {
            state.show = payload;
        },
        orderItems: function (state, payload) {
            state.orderItems = payload;
        },
        orderBranch: function (state, payload) {
            state.orderBranch = payload;
        },
        orderUser: function (state, payload) {
            state.orderUser = payload;
        },
        reset: function(state) {
            state.temp.temp_id = null;
            state.temp.isEditing = false;
        }
    },
}
