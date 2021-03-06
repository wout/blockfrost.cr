struct Blockfrost::Transaction::Utxo < Blockfrost::Resource
  getter hash : String
  getter inputs : Array(Input)
  getter outputs : Array(Output)

  def self.get(hash : String) : Utxo
    Utxo.from_json(client.get("txs/#{hash}/utxos"))
  end

  struct Input
    include JSON::Serializable

    getter address : String
    getter amount : Array(Unit)
    getter tx_hash : String
    getter output_index : Int32
    getter data_hash : String?
    getter collateral : Bool
  end

  struct Output
    include JSON::Serializable

    getter address : String
    getter amount : Array(Unit)
    getter output_index : Int32
    getter data_hash : String?
  end
end
