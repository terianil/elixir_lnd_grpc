defmodule Walletrpc.WitnessType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  @type t ::
          integer
          | :UNKNOWN_WITNESS
          | :COMMITMENT_TIME_LOCK
          | :COMMITMENT_NO_DELAY
          | :COMMITMENT_REVOKE
          | :HTLC_OFFERED_REVOKE
          | :HTLC_ACCEPTED_REVOKE
          | :HTLC_OFFERED_TIMEOUT_SECOND_LEVEL
          | :HTLC_ACCEPTED_SUCCESS_SECOND_LEVEL
          | :HTLC_OFFERED_REMOTE_TIMEOUT
          | :HTLC_ACCEPTED_REMOTE_SUCCESS
          | :HTLC_SECOND_LEVEL_REVOKE
          | :WITNESS_KEY_HASH
          | :NESTED_WITNESS_KEY_HASH
          | :COMMITMENT_ANCHOR

  field :UNKNOWN_WITNESS, 0

  field :COMMITMENT_TIME_LOCK, 1

  field :COMMITMENT_NO_DELAY, 2

  field :COMMITMENT_REVOKE, 3

  field :HTLC_OFFERED_REVOKE, 4

  field :HTLC_ACCEPTED_REVOKE, 5

  field :HTLC_OFFERED_TIMEOUT_SECOND_LEVEL, 6

  field :HTLC_ACCEPTED_SUCCESS_SECOND_LEVEL, 7

  field :HTLC_OFFERED_REMOTE_TIMEOUT, 8

  field :HTLC_ACCEPTED_REMOTE_SUCCESS, 9

  field :HTLC_SECOND_LEVEL_REVOKE, 10

  field :WITNESS_KEY_HASH, 11

  field :NESTED_WITNESS_KEY_HASH, 12

  field :COMMITMENT_ANCHOR, 13
end

defmodule Walletrpc.ListUnspentRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          min_confs: integer,
          max_confs: integer
        }

  defstruct [:min_confs, :max_confs]

  field :min_confs, 1, type: :int32
  field :max_confs, 2, type: :int32
end

defmodule Walletrpc.ListUnspentResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          utxos: [Lnrpc.Utxo.t()]
        }

  defstruct [:utxos]

  field :utxos, 1, repeated: true, type: Lnrpc.Utxo
end

defmodule Walletrpc.LeaseOutputRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: binary,
          outpoint: Lnrpc.OutPoint.t() | nil
        }

  defstruct [:id, :outpoint]

  field :id, 1, type: :bytes
  field :outpoint, 2, type: Lnrpc.OutPoint
end

defmodule Walletrpc.LeaseOutputResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          expiration: non_neg_integer
        }

  defstruct [:expiration]

  field :expiration, 1, type: :uint64
end

defmodule Walletrpc.ReleaseOutputRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: binary,
          outpoint: Lnrpc.OutPoint.t() | nil
        }

  defstruct [:id, :outpoint]

  field :id, 1, type: :bytes
  field :outpoint, 2, type: Lnrpc.OutPoint
end

defmodule Walletrpc.ReleaseOutputResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3
  @type t :: %__MODULE__{}

  defstruct []
end

defmodule Walletrpc.KeyReq do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          key_finger_print: integer,
          key_family: integer
        }

  defstruct [:key_finger_print, :key_family]

  field :key_finger_print, 1, type: :int32
  field :key_family, 2, type: :int32
end

defmodule Walletrpc.AddrRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3
  @type t :: %__MODULE__{}

  defstruct []
end

defmodule Walletrpc.AddrResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          addr: String.t()
        }

  defstruct [:addr]

  field :addr, 1, type: :string
end

defmodule Walletrpc.Transaction do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          tx_hex: binary,
          label: String.t()
        }

  defstruct [:tx_hex, :label]

  field :tx_hex, 1, type: :bytes
  field :label, 2, type: :string
end

defmodule Walletrpc.PublishResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          publish_error: String.t()
        }

  defstruct [:publish_error]

  field :publish_error, 1, type: :string
end

defmodule Walletrpc.SendOutputsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          sat_per_kw: integer,
          outputs: [Signrpc.TxOut.t()],
          label: String.t(),
          min_confs: integer,
          spend_unconfirmed: boolean
        }

  defstruct [:sat_per_kw, :outputs, :label, :min_confs, :spend_unconfirmed]

  field :sat_per_kw, 1, type: :int64
  field :outputs, 2, repeated: true, type: Signrpc.TxOut
  field :label, 3, type: :string
  field :min_confs, 4, type: :int32
  field :spend_unconfirmed, 5, type: :bool
end

defmodule Walletrpc.SendOutputsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          raw_tx: binary
        }

  defstruct [:raw_tx]

  field :raw_tx, 1, type: :bytes
end

defmodule Walletrpc.EstimateFeeRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          conf_target: integer
        }

  defstruct [:conf_target]

  field :conf_target, 1, type: :int32
end

defmodule Walletrpc.EstimateFeeResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          sat_per_kw: integer
        }

  defstruct [:sat_per_kw]

  field :sat_per_kw, 1, type: :int64
end

defmodule Walletrpc.PendingSweep do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          outpoint: Lnrpc.OutPoint.t() | nil,
          witness_type: Walletrpc.WitnessType.t(),
          amount_sat: non_neg_integer,
          sat_per_byte: non_neg_integer,
          broadcast_attempts: non_neg_integer,
          next_broadcast_height: non_neg_integer,
          requested_conf_target: non_neg_integer,
          requested_sat_per_byte: non_neg_integer,
          force: boolean
        }

  defstruct [
    :outpoint,
    :witness_type,
    :amount_sat,
    :sat_per_byte,
    :broadcast_attempts,
    :next_broadcast_height,
    :requested_conf_target,
    :requested_sat_per_byte,
    :force
  ]

  field :outpoint, 1, type: Lnrpc.OutPoint
  field :witness_type, 2, type: Walletrpc.WitnessType, enum: true
  field :amount_sat, 3, type: :uint32
  field :sat_per_byte, 4, type: :uint32
  field :broadcast_attempts, 5, type: :uint32
  field :next_broadcast_height, 6, type: :uint32
  field :requested_conf_target, 8, type: :uint32
  field :requested_sat_per_byte, 9, type: :uint32
  field :force, 7, type: :bool
end

defmodule Walletrpc.PendingSweepsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3
  @type t :: %__MODULE__{}

  defstruct []
end

defmodule Walletrpc.PendingSweepsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          pending_sweeps: [Walletrpc.PendingSweep.t()]
        }

  defstruct [:pending_sweeps]

  field :pending_sweeps, 1, repeated: true, type: Walletrpc.PendingSweep
end

defmodule Walletrpc.BumpFeeRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          outpoint: Lnrpc.OutPoint.t() | nil,
          target_conf: non_neg_integer,
          sat_per_byte: non_neg_integer,
          force: boolean
        }

  defstruct [:outpoint, :target_conf, :sat_per_byte, :force]

  field :outpoint, 1, type: Lnrpc.OutPoint
  field :target_conf, 2, type: :uint32
  field :sat_per_byte, 3, type: :uint32
  field :force, 4, type: :bool
end

defmodule Walletrpc.BumpFeeResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3
  @type t :: %__MODULE__{}

  defstruct []
end

defmodule Walletrpc.ListSweepsRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          verbose: boolean
        }

  defstruct [:verbose]

  field :verbose, 1, type: :bool
end

defmodule Walletrpc.ListSweepsResponse.TransactionIDs do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          transaction_ids: [String.t()]
        }

  defstruct [:transaction_ids]

  field :transaction_ids, 1, repeated: true, type: :string
end

defmodule Walletrpc.ListSweepsResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          sweeps: {atom, any}
        }

  defstruct [:sweeps]

  oneof :sweeps, 0
  field :transaction_details, 1, type: Lnrpc.TransactionDetails, oneof: 0
  field :transaction_ids, 2, type: Walletrpc.ListSweepsResponse.TransactionIDs, oneof: 0
end

defmodule Walletrpc.LabelTransactionRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          txid: binary,
          label: String.t(),
          overwrite: boolean
        }

  defstruct [:txid, :label, :overwrite]

  field :txid, 1, type: :bytes
  field :label, 2, type: :string
  field :overwrite, 3, type: :bool
end

defmodule Walletrpc.LabelTransactionResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3
  @type t :: %__MODULE__{}

  defstruct []
end

defmodule Walletrpc.FundPsbtRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          template: {atom, any},
          fees: {atom, any}
        }

  defstruct [:template, :fees]

  oneof :template, 0
  oneof :fees, 1
  field :psbt, 1, type: :bytes, oneof: 0
  field :raw, 2, type: Walletrpc.TxTemplate, oneof: 0
  field :target_conf, 3, type: :uint32, oneof: 1
  field :sat_per_vbyte, 4, type: :uint32, oneof: 1
end

defmodule Walletrpc.FundPsbtResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          funded_psbt: binary,
          change_output_index: integer,
          locked_utxos: [Walletrpc.UtxoLease.t()]
        }

  defstruct [:funded_psbt, :change_output_index, :locked_utxos]

  field :funded_psbt, 1, type: :bytes
  field :change_output_index, 2, type: :int32
  field :locked_utxos, 3, repeated: true, type: Walletrpc.UtxoLease
end

defmodule Walletrpc.TxTemplate.OutputsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto3

  @type t :: %__MODULE__{
          key: String.t(),
          value: non_neg_integer
        }

  defstruct [:key, :value]

  field :key, 1, type: :string
  field :value, 2, type: :uint64
end

defmodule Walletrpc.TxTemplate do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          inputs: [Lnrpc.OutPoint.t()],
          outputs: %{String.t() => non_neg_integer}
        }

  defstruct [:inputs, :outputs]

  field :inputs, 1, repeated: true, type: Lnrpc.OutPoint
  field :outputs, 2, repeated: true, type: Walletrpc.TxTemplate.OutputsEntry, map: true
end

defmodule Walletrpc.UtxoLease do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: binary,
          outpoint: Lnrpc.OutPoint.t() | nil,
          expiration: non_neg_integer
        }

  defstruct [:id, :outpoint, :expiration]

  field :id, 1, type: :bytes
  field :outpoint, 2, type: Lnrpc.OutPoint
  field :expiration, 3, type: :uint64
end

defmodule Walletrpc.FinalizePsbtRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          funded_psbt: binary
        }

  defstruct [:funded_psbt]

  field :funded_psbt, 1, type: :bytes
end

defmodule Walletrpc.FinalizePsbtResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          signed_psbt: binary,
          raw_final_tx: binary
        }

  defstruct [:signed_psbt, :raw_final_tx]

  field :signed_psbt, 1, type: :bytes
  field :raw_final_tx, 2, type: :bytes
end

defmodule Walletrpc.WalletKit.Service do
  @moduledoc false
  use GRPC.Service, name: "walletrpc.WalletKit"

  rpc :ListUnspent, Walletrpc.ListUnspentRequest, Walletrpc.ListUnspentResponse

  rpc :LeaseOutput, Walletrpc.LeaseOutputRequest, Walletrpc.LeaseOutputResponse

  rpc :ReleaseOutput, Walletrpc.ReleaseOutputRequest, Walletrpc.ReleaseOutputResponse

  rpc :DeriveNextKey, Walletrpc.KeyReq, Signrpc.KeyDescriptor

  rpc :DeriveKey, Signrpc.KeyLocator, Signrpc.KeyDescriptor

  rpc :NextAddr, Walletrpc.AddrRequest, Walletrpc.AddrResponse

  rpc :PublishTransaction, Walletrpc.Transaction, Walletrpc.PublishResponse

  rpc :SendOutputs, Walletrpc.SendOutputsRequest, Walletrpc.SendOutputsResponse

  rpc :EstimateFee, Walletrpc.EstimateFeeRequest, Walletrpc.EstimateFeeResponse

  rpc :PendingSweeps, Walletrpc.PendingSweepsRequest, Walletrpc.PendingSweepsResponse

  rpc :BumpFee, Walletrpc.BumpFeeRequest, Walletrpc.BumpFeeResponse

  rpc :ListSweeps, Walletrpc.ListSweepsRequest, Walletrpc.ListSweepsResponse

  rpc :LabelTransaction, Walletrpc.LabelTransactionRequest, Walletrpc.LabelTransactionResponse

  rpc :FundPsbt, Walletrpc.FundPsbtRequest, Walletrpc.FundPsbtResponse

  rpc :FinalizePsbt, Walletrpc.FinalizePsbtRequest, Walletrpc.FinalizePsbtResponse
end

defmodule Walletrpc.WalletKit.Stub do
  @moduledoc false
  use GRPC.Stub, service: Walletrpc.WalletKit.Service
end
