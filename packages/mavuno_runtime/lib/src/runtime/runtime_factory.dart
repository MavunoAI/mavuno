import '../generation/llama_generator.dart';
import '../inference/greedy_sampler.dart';
import '../inference/inference_engine.dart';
import '../inference/llama_inference_engine.dart';

import '../native/batch_builder.dart';
import '../native/llama_batch_builder.dart';
import '../native/llama_native.dart';
import '../native/llama_compat.dart';
import '../native/native_batch_factory.dart';

import '../native/runtime/llama_native_batch_allocator.dart';
import '../native/runtime/llama_native_batch_writer.dart';
import '../native/runtime/llama_native_decoder.dart';
import '../native/runtime/llama_native_logits_reader.dart';
import '../native/runtime/llama_native_batch_factory.dart';

import 'runtime.dart';

/// Builds a fully configured production Runtime.
///
/// This is the single composition root for the
/// Mavuno Runtime.
///
/// No business logic belongs here.
/// It only wires production components together.
Runtime createRuntime({required LlamaNative native, required LlamaCompat compat}) {
  //
  // Batch Builder
  //
  const BatchBuilder batchBuilder = LlamaBatchBuilder();

  //
  // Native Batch
  //
  final allocator = LlamaNativeBatchAllocator(compat: compat);

  const writer = LlamaNativeBatchWriter();

  final NativeBatchFactory batchFactory = LlamaNativeBatchFactory(
    allocator: allocator,
    writer: writer,
  );

  //
  // Logits
  //
  final logitsReader = LlamaNativeLogitsReader(compat);

  //
  // Decoder
  //
  final decoder = LlamaNativeDecoder(
    compat: compat,
    batchBuilder: batchBuilder,
    batchFactory: batchFactory,
    logitsReader: logitsReader,
  );

  //
  // Sampler
  //
  const sampler = GreedySampler();

  //
  // Inference Engine
  //
  final InferenceEngine engine = LlamaInferenceEngine(decoder: decoder, sampler: sampler);

  //
  // Generator
  //
  final generator = LlamaGenerator(native: native, engine: engine);

  //
  // Runtime
  //
  return Runtime(generator: generator);
}
