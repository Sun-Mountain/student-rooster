<script setup lang="ts">
import { defineProps, toRefs } from 'vue';

const props = defineProps({ id: { type: String, required: true, },
                            label: { type: String, required: true, },
                            type: { type: String, required: true,},
                            required: { type: Boolean, required: false, default: false, },
                            value: { type: String, required: false, default: '' },
                          });

const { label, value } = toRefs(props);
</script>

<template>
  <div class="form-field-container">
    <label for="{{ id }}">{{ label }}:</label><br />
    <input type="{{ type }}" id="{{ id }}" v-model="value" required />
  </div>
</template>