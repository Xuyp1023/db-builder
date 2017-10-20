<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN\" \"<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="zh-CN">
<head>
  <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="IE=7,9,10,11" />
  <title>应收账款提前回款协议书</title>
  <style style="text/css">
    .container{width: 800px;font: normal normal 13px 宋体;padding:40px;}

    .width-100{width: 100%;}
    .width-90{width: 90%;}
    .width-80{width: 80%;}
    .width-85{width: 85%;}
    .width-min-50{min-width: 50%;}

    .margin-auto{margin: auto;}
    .margin-top-30{margin-top: 30px;}

    .text-align-left{text-align: left;}
    .text-align-left-im{text-align: left!important;}
    .text-align-center{text-align: center;}
    .text-align-center-im{text-align: center!important;}
    .text-align-right{text-align: right;}
    .text-align-right-im{text-align: right!important;}
    .text-under-line{text-decoration: underline;}
    .text-indent{text-indent: 2em;}

    .font-14{font-size: 13px;}

    .line{font-size: 13px;font-family: 宋体;line-height: 2em;}
    .line.line-condensed{line-height: 1em;margin: 5px 0;}

    .table{border-collapse: collapse;}
    .table tr td{padding: 12px 6px;text-align: left;vertical-align: middle;}
    .table.table-bordered{border-left: 1px solid black;border-top: 1px solid black;}
    .table.table-bordered tr td{border-bottom: 1px solid black;border-right: 1px solid black;}
    
      tr{
        height: 30px;
        line-height: 30px;
      }

  </style>
</head>
<body>
  <div class="container margin-auto">
    <h3 class="text-align-center">应收账款提前回款协议书</h3>
    <p class="line text-align-right">
      协议编号：<span class="text-under-line">${request.elecAgreement.agreeNo!''}</span>
    </p>

    <div>
      <p>
        <span>甲方（资金方） ：</span> <span>${request.factoryName}</span>
      </p>
      <p>
        <span>联系人 ：</span> <span>${factoryOperator.name!''}</span>
      </p>
      <p style="margin-bottom: 20px;">
        <span>联系方式 ：</span> <span>${factoryOperator.phone!''}</span>
      </p>
      <p>
        <span>乙方（供应方） ：</span> <span>${request.custName}</span>
      </p>
      <p>
        <span>联系人 ：</span> <span>${custoperator.name!''}</span>
      </p>
      <p>
        <span>联系方式 ：</span> <span>${custoperator.phone!''}</span>
      </p>
    </div>

	  <p class="line text-indent">
      为了双方资金周转的需要，甲乙双方好友经协商,一致达成以下协议：
    </p> 
	  <h3>第一条 应收账款</h3> 
    <p class="line text-indent">
      就乙方与 <span>${request.coreCustName}</span>（甲方的成员企业）签订的编号 <span>${request.asset.basedataMap.receivableList[0].agreeNo} </span>的合同项下, 产生的应收账款￥<span>${request.balance} </span> 元，人民币大写：<span>${balanceCN!''} </span>，对应的《发票清单》，原付款时间为<span>
	  <#if (request.endDate) ?? && ((request.endDate)?length > 7) >  
		                ${request.endDate?substring(0,4)} 
		                <#else>  
		                ${request.endDate!''}  
		            </#if>
		   
		  </span>年<span>
		   <#if (request.endDate)?? && ((request.endDate)?length > 7) >  
		                ${request.endDate?substring(4,6)} 
		                <#else>  
		                ${request.endDate!''}  
		            </#if>
		  
		  </span>月<span>
		  <#if (request.endDate)?? && ((request.endDate)?length > 7) >  
		                ${request.endDate?substring(6,8)} 
		                <#else>  
		                ${request.endDate!''}  
		            </#if>
		  
		  </span>日。
    </p>

    <h3>第二条 折扣</h3> 
    <p class="line text-indent">
      乙 方同意以<span>${request.custCoreRate} </span> %的折扣率提前收回该应收账款，即给予甲方￥<span>${request.balance - request.requestPayBalance} </span>元的折扣 ，折扣后甲方向乙方付款￥<span>${request.requestPayBalance} </span> 元 ,人民币大写： <span>${payBalanceCN!''} </span> 。
    </p>

    <h3>第三条 付款</h3> 
    <p class="line text-indent">
      甲方在<span>
	  <#if (request.requestPayDate)?? && ((request.requestPayDate)?length > 7) >  
		                ${request.requestPayDate?substring(0,4)} 
		                <#else>  
		                ${request.requestPayDate!''}  
		            </#if>
		  </span>年<span>

			<#if (request.requestPayDate)?? && ((request.requestPayDate)?length > 7) >  
		                ${request.requestPayDate?substring(4,6)} 
		                <#else>  
		                ${request.requestPayDate!''}  
		            </#if>
					</span>月<span>
					<#if (request.requestPayDate)?? && ((request.requestPayDate)?length > 7) >  
		                ${request.requestPayDate?substring(6,8)} 
		                <#else>  
		                ${request.requestPayDate!''}  
		            </#if>
	  </span> 日前将第二条的款项￥<span>${request.requestPayBalance}</span>元支付至乙方指定的账户 ：

    </p>
    <p class="line text-indent">
      <p>账户名称: <span>${request.custBankAccountName}</span></p>
      <p>账号: <span>${request.custBankAccount}</span></p>
      <p>开户银行: <span>${request.custBankName}</span></p>
    </p>

    <h3>第四条 发票</h3> 
    <p class="line text-indent">
      甲方在本协议生效后壹个月内将第二条的折扣金额￥<span>${request.balance - request.requestPayBalance}</span> 元给乙方开具发票。
    </p>

    <h3>第五条 范围</h3> 
    <p class="line text-indent">
      本协议仅对上述价款 应收账款有效,双方按照以上条款执行后，将结清此笔应收账款与涉及甲乙双方的债权债务关系；
    </p>

    <h3>第六条 协议的附件</h3> 
    <p class="line text-indent">
      <span>第六条</span> <span>协议的附件</span>
      <p>下列附件是本协议不可分割的部分：
      附件一《发票清单》</p>
    </p>

    <h3>第七条 争议解决</h3> 
    <p class="line text-indent">
      凡因本协议引起的或与本协议有关的任何争议，可以通过协商解决，协商不成，向乙方所在地人民法院起诉。
    </p>

    <h3>第八条 生效条件</h3> 
    <p class="line text-indent" style="margin-bottom: 60px">
      本协议一式两份，双方盖章或签字后生效，具有同等法律效力，也作为双方记账收据。
    </p>

    <div class="petro">
    <table width="100%" style="margin: 0 auto">
          <tbody>
            <tr>
                <td width="17%" class="blod">甲方（全称）：</td>
                <td width="33%">
                  <span>${request.factoryName}</span>
                </td>
                <td width="17%" class="blod">乙方（全称）：</td>
                <td width="33%">
                  <span>${request.custName}</span>
                </td>
            </tr>
            <tr>
                <td class="blod">签字/盖章：</td>
                <td>
                  <span>${request.factoryName}</span>
                </td>
                <td class="blod">签字/盖章：</td>
                <td>
                  <span>${request.custName}</span>
                </td>
            </tr>
          </tbody>

          <tfoot>
              <tr>
                  <td width="13%">
                    日期：
                  </td>
                  <td width="37%">
                       <span>
							<#if (request.elecAgreement.signDate)?? && ((request.elecAgreement.signDate)?length > 7) >  
								${request.elecAgreement.signDate?substring(0,4)} 
								<#else>  
								${.now?string("yyyy")}  
							</#if>
							</span>年
			                <span>
							
							<#if (request.elecAgreement.signDate)?? && ((request.elecAgreement.signDate)?length > 7) >  
								${request.elecAgreement.signDate?substring(4,6)} 
								<#else>  
								${.now?string("MM")}  
							</#if>
							</span>月
			                <span>
							<#if (request.elecAgreement.signDate)?? && ((request.elecAgreement.signDate)?length > 7) >  
								${request.elecAgreement.signDate?substring(6,8)} 
								<#else>  
								${.now?string("dd")}  
							</#if>
							</span>日
                  </td>
                  <td width="13%">
                    日期：
                  </td>
                  <td width="37%">
                       <span>
							<#if (request.elecAgreement.signDate)?? && ((request.elecAgreement.signDate)?length > 7) >  
								${request.elecAgreement.signDate?substring(0,4)} 
								<#else>  
								${.now?string("yyyy")}  
							</#if>
							</span>年
			                <span>
							
							<#if (request.elecAgreement.signDate)?? && ((request.elecAgreement.signDate)?length > 7) >  
								${request.elecAgreement.signDate?substring(4,6)} 
								<#else>  
								${.now?string("MM")}  
							</#if>
							</span>月
			                <span>
							<#if (request.elecAgreement.signDate)?? && ((request.elecAgreement.signDate)?length > 7) >  
								${request.elecAgreement.signDate?substring(6,8)} 
								<#else>  
								${.now?string("dd")}  
							</#if>
							</span>日
                  </td>
              </tr>
          </tfoot>
          
    </table>   
    
    <!-- <p class="datatime" style="margin-top: 30px;margin-bottom: 30px;">
      <div style="width:30%;display: inline-block;margin-left: 47px">
        <b>日期:</b> <span>${sourceAgreementDateYear!''}</span><b>年</b> <span>${sourceAgreementDateMonthy!''}</span> <b>月</b> <span>${sourceAgreementDateDay!''}</span><b>日</b>
      </div>
      <div style="width:30%;display: inline-block;margin-left: 120px">
        <b>日期:</b> <span>${sourceAgreementDateYear!''}</span><b>年</b> <span>${sourceAgreementDateMonthy!''}</span> <b>月</b> <span>${sourceAgreementDateDay!''}</span><b>日</b>
      </div>    
    </p> -->
  </div>

  
  <h3>附件一:</h3>  
    <table width="100%" border="1" cellspacing="0" style="margin:0 auto;text-align: center;margin-bottom: 20px">
      
      <caption style="font-size:22px;margin-bottom: 10px">发票清单</caption>
      <thead>
        <tr>          
            <th width="10%">序号</th>
            <th width="22%">发票编号</th>
            <th width="22%">发票金额(元)</th>
            <th width="23%">购买方</th>
            <th width="23%">日期</th>           
        </tr>
      </thead>
      <tbody>
      <#list request.asset.basedataMap.invoiceList as bill> 
      <tr>
        <td>${bill_index+1}</td>
        <td >${(bill.invoiceNo)!''}</td>
        <td >￥${(bill.balance)!''}</td>
        <td >${(bill.coreCustName)!''}</td>
        <td>
            <#if (bill.invoiceDate)?? && ((bill.invoiceDate)?length > 7) >  
                ${(bill.invoiceDate)?substring(0,4)}-${(bill.invoiceDate)?substring(4,6)}-${(bill.invoiceDate)?substring(6,8)}  
                <#else>  
                ${(bill.invoiceDate)!''}  
            </#if>  
        </td>
      </tr>
    </#list>
    </tbody>
    </table>

    
  </div>
</body>
</html>
