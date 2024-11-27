
f_power_sed_ecp() {
    : 'Escape strings for the "sed" command.

    Args:
        F_VAL_TO_ECP (str): Value to be escaped.
        F_ECP_TYPE (int): 0 - For the TARGET value; 1 - For the REPLACE value.

    Returns:
        F_EZ_SED_ECP_R (str): Escaped value.
    '

    F_VAL_TO_ECP=$1
    F_ECP_TYPE=$2
    if [ ${F_ECP_TYPE} -eq 0 ] ; then
    # NOTE: For the TARGET value. By Questor

        F_EZ_SED_ECP_R=$(echo "x${F_VAL_TO_ECP}x" | sed 's/[]\/$*.^|[]/\\&/g' | sed 's/\t/\\t/g' | sed "s/'/\\\x27/g")
    else
    # NOTE: For the REPLACE value. By Questor

        F_EZ_SED_ECP_R=$(echo "x${F_VAL_TO_ECP}x" | sed 's/[]\/$*.^|[]/\\&/g' | sed 's/\t/\\t/g' | sed "s/'/\\\x27/g" | sed ':a;N;$!ba;s/\n/\\n/g')
    fi

    F_EZ_SED_ECP_R=${F_EZ_SED_ECP_R%?}
    F_EZ_SED_ECP_R=${F_EZ_SED_ECP_R#?}

}

f_ez_sed() {
    : 'Facilitate the use of the "sed" command. Replaces in files and strings.

    Args:
        F_TARGET (str): Value to be replaced by the value of F_REPLACE.
        F_REPLACE (str): Value that will replace F_TARGET.
        F_FILE (Optional[str]): File in which the replacement will be made.
        F_ALL_OCCUR (Optional[int]): 0 - Replace only on the first occurrence;
1 - Replace every occurrence. Default 0.
    '

    F_TARGET=$1
    F_REPLACE=$2
    F_FILE=$3
    F_ALL_OCCUR=$4
    if [ -z "$F_ALL_OCCUR" ] ; then
        F_ALL_OCCUR=0
    fi
    f_power_sed_ecp "$F_TARGET" 0
    F_TARGET=$F_EZ_SED_ECP_R
    f_power_sed_ecp "$F_REPLACE" 1
    F_REPLACE=$F_EZ_SED_ECP_R
    if [ ${F_ALL_OCCUR} -eq 0 ] ; then
        SED_RPL="'0,/$F_TARGET/s//$F_REPLACE/g'"
    else
        SED_RPL="'s/$F_TARGET/$F_REPLACE/g'"
    fi

    eval "sed -i $SED_RPL $F_FILE"

}
