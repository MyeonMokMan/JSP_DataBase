<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
</head>
<body>
	<center>
	<h2>ȸ�� ����</h2>
	<form action="MemberJoinProc.jsp" method="post">
		<table width="500" border="1">
			<tr height="50">
				<td width="150" align="center">���̵�</td>
				<td width="350" align="center"><input type="text" name="id" size="40" placeholder="���̵� �Է��ϼ���." required></td>	
			</tr>
			<tr height="50">
				<td width="150" align="center">��й�ȣ</td>
				<td width="350" align="center"><input type="password" name="pass1" size="40" placeholder="��й�ȣ�� �Է��ϼ���." required></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">��й�ȣ Ȯ��</td>
				<td width="350" align="center"><input type="password" name="pass2" size="40" placeholder="��й�ȣ�� �Է��ϼ���." required></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">�̸���</td>
				<td width="350" align="center"><input type="email" name="email" size="40"></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">��ȭ��ȣ</td>
				<td width="350" align="center"><input type="tel" name="tel" size="40"></td>
			</tr>
			<tr height="50">
				<td width="150" align="center">���ɺо�</td>
				<td width="350" align="center">
					<input type="checkbox" name="hobby" value="���">���
					<input type="checkbox" name="hobby" value="����">����
					<input type="checkbox" name="hobby" value="����">����
					<input type="checkbox" name="hobby" value="�ڵ�">�ڵ�
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">����</td>
				<td width="350" align="center">
					<select name="job">
						<option value="�л�">�л�</option>
						<option value="����">����</option>
						<option value="ȸ���">ȸ���</option>
						<option value="�ڿ�����">�ڿ�����</option>
						<option value="������">������</option>
					</select>
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">���ɴ�</td>
				<td width="350" align="center">
					<input type="radio" name="age" value="10��">10��
					<input type="radio" name="age" value="20��">20��
					<input type="radio" name="age" value="30��">30��
					<input type="radio" name="age" value="40��">40��
					<input type="radio" name="age" value="50��">50��
					<input type="radio" name="age" value="60��">60��
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">����</td>
				<td width="350" align="center">
					<textarea rows="5" cols="40" name="info"></textarea>
				</td>
			</tr>
			<tr height="50">
				<td colspan="2" align="center">
					<input type="submit" value="����"></button>
					<input type="reset" value="�ʱ�ȭ"></button>
				</td>
			</tr>
		</table>
	</form>
	</center>
</body>
</html>