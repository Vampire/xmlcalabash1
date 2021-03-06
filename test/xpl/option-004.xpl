<p:declare-step xmlns:t="http://xproc.org/ns/testsuite" xmlns:p="http://www.w3.org/ns/xproc" xmlns:c="http://www.w3.org/ns/xproc-step" xmlns:err="http://www.w3.org/ns/xproc-error" version="1.0" name="main">
      <p:output port="result"/>
      <p:option name="opt1" select="'val1'"/>
      <p:option name="opt2" select="concat($opt1, 'val2')"/>
      <p:option name="opt3" select="concat($opt1, $opt2, 'val3')"/>

      <p:choose>
        <p:when test="$opt1 = 'val1' and $opt2 = 'val1val2' and $opt3 = 'val1val1val2val3'">
	  <p:xpath-context><p:empty/></p:xpath-context>
          <p:identity>
            <p:input port="source">
              <p:inline><success/></p:inline>
            </p:input>
          </p:identity>
        </p:when>
        <p:otherwise>
          <p:identity>
            <p:input port="source">
              <p:inline><failure/></p:inline>
            </p:input>
          </p:identity>
        </p:otherwise>
      </p:choose>
    </p:declare-step>