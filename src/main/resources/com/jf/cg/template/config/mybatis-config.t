<?xml version="1.0" encoding="UTF-8" ?>
   
<!DOCTYPE configuration
  PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-config.dtd">

<configuration>
	<settings>
		<setting name="jdbcTypeForNull" value="NULL"/>
	</settings>
    <mappers>
${mapperResource}
    </mappers>
</configuration>