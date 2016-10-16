--Listing 10-54.  Sample XML Input File for DTA
<?xml version="1.0" encoding="utf-16" ?>
<DTAXML xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://schemas.microsoft.
com/sqlserver/2004/07/dta">
 <DTAInput>
  <Server>
   <Name>STR8-SQL-PRD</Name>
   <Database>
    <Name>AdventureWorks2012</Name>
   </Database>
  </Server>
  <Workload>
   <File>c:\temp\IndexingMethod.trc</File>
   <File>c:\temp\IndexingMethod_1.trc</File>
  </Workload>
  <TuningOptions>
   <TestServer> STR8-SQL-TEST </TestServer>
   <FeatureSet>IDX</FeatureSet>
   <Partitioning>NONE</Partitioning>
   <KeepExisting>NONE</KeepExisting>
  </TuningOptions>
 </DTAInput>
</DTAXML>