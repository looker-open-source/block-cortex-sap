#########################################################{
# PURPOSE
# Provide Ledger Name and other details
#
# SOURCE
# Refines View universal_ledgers_md (defined in file universal_ledgers_base.view)
#
# REFERENCED BY
# Explore profit_and_loss
#
# DERIVED DIMENSION
#   ledger_id_name -- concatenation of ledger_rldnr and name_name and used for Income Statement dashboard filter
#
# KEYS TO USING
#   - Fields are hidden by default so must change "hidden: " property to "no" to include in an Explore
#   - currently only Ledger Name and Ledger ID - Name are unhidden
#   - this View is labeled "Profit and Loss" when included in Explore profit_and_loss
#   - this View is labeled "Balance Sheet" when included in Explore balance_sheet
#
#########################################################}

include: "/views/universal_ledgers_md_base.view"

view: +universal_ledgers_md {
  fields_hidden_by_default: yes

  dimension: key {
    type: string
    primary_key: yes
    sql: CONCAT(${client_mandt}, ${ledger_rldnr}, ${language_langu}) ;;
  }

  dimension: ledger_rldnr {
    label: "Ledger RLDNR"
  }

  dimension: name_name {
    hidden: no
    label: "Ledger Name"
  }

  dimension: ledger_id_name {
    hidden: no
    label: "Ledger ID - Name"
    description: "Concatentation of Ledger ID and Name (e.g., 0L - Leading Ledger)"
    sql: CONCAT(${ledger_rldnr},' - ',${name_name}) ;;
  }

  dimension: is_leading_ledger{
    type: yesno
    sql: ${leading_ledger_indicator_xleading} = 'X' ;;
  }

  dimension: is_cash_ledger {
    type: yesno
    sql: ${cash_ledger_indicator_xcash_ledger} = 'X' ;;
  }

}
