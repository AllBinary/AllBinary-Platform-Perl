#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::logic::communication::sql::AbSqlBean;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::sql::AbSqlRow';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{METHOD_GET_FIELD} = "getField";
    $self->{METHOD_IS_SUBSET_OF_ENTRY} = "isSubsetOfEntry";
}


sub new {
    my ($class, $databaseConnectionInfoInterface) = @_;
    my $self = $class->SUPER::new($databaseConnectionInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub getField {
    my ($self, $key, $value, $requestedField) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{SELECT});
        $stringBuffer->append($requestedField);
        $stringBuffer->append($self->{sqlStrings}->{FROM});
        $stringBuffer->append($self->getTableName());
        $stringBuffer->append($self->{sqlStrings}->{WHERE});
        $stringBuffer->append($key);
        $stringBuffer->append($self->{sqlStrings}->{EQUAL_QUOTE});
        $stringBuffer->append($value);
        $stringBuffer->append($self->{sqlStrings}->{CLOSE_QUOTE});
        my $sqlStatement = $stringBuffer->toString();
        try {
            my $field = $self->{stringUtil}->{EMPTY_STRING};
            my $rset = $self->executeSQLStatement($sqlStatement);
            while ($rset->next()) {
                $field = $rset->getString($requestedField);
                if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                    $stringBuffer->delete(0, $stringBuffer->length());
                    $stringBuffer->append($self->{sqlStrings}->{SQL_STATEMENT_LABEL});
                    $stringBuffer->append($sqlStatement);
                    $stringBuffer->append($self->{sqlStrings}->{FIELD_VALUE});
                    $stringBuffer->append($field);
                    $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{METHOD_GET_FIELD});
                }
                return $field;
            }
            return undef;
        } catch ($e) {
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{FAILED_SQL_STATEMENT} . $sqlStatement, $self, $self->{METHOD_GET_FIELD}, $e);
            }
            return $self->{FAILED_SQL_STATEMENT} . $sqlStatement;
        }
}


# Java overloaded method: Perl keeps the last definition
sub getField {
    my ($self, $keysAndValues, $requestedField) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{SELECT});
        $stringBuffer->append($requestedField);
        $stringBuffer->append($self->{sqlStrings}->{FROM});
        $stringBuffer->append($self->getTableName());
        $stringBuffer->append($self->{sqlStrings}->{WHERE});
        try {
            my $field = $self->{stringUtil}->{EMPTY_STRING};
            my $set = $keysAndValues->keySet();
            my $keyArray = $set->toArray();
            my $size = scalar(@{$keyArray});
            my $key = undef;
            my $value = undef;
            for (my $i = 0; $i < $size; $i++) {
                $key = $keyArray->[$i];
                $value = ("" . $keysAndValues->get($key));
                $stringBuffer->append($key);
                $stringBuffer->append($self->{sqlStrings}->{EQUAL_QUOTE});
                $stringBuffer->append($value);
                $stringBuffer->append($self->{sqlStrings}->{CLOSE_QUOTE});
                if ($i < $size - 1) {
                    $stringBuffer->append($self->{sqlStrings}->{AND});
                }
            }
            my $sqlStatement = $stringBuffer->toString();
            my $rset = $self->executeSQLStatement($sqlStatement);
            while ($rset->next()) {
                $field = $rset->getString($requestedField);
                if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
                    $stringBuffer->delete(0, $stringBuffer->length());
                    $stringBuffer->append($self->{sqlStrings}->{SQL_STATEMENT_LABEL});
                    $stringBuffer->append($sqlStatement);
                    $stringBuffer->append($self->{sqlStrings}->{FIELD_VALUE});
                    $stringBuffer->append($field);
                    $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{METHOD_GET_FIELD});
                }
                return $field;
            }
            return undef;
        } catch ($e) {
            my $sqlStatement = $stringBuffer->toString();
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{FAILED_SQL_STATEMENT} . $sqlStatement, $self, $self->{METHOD_GET_FIELD}, $e);
            }
            return $self->{FAILED_SQL_STATEMENT} . $sqlStatement;
        }
}


sub isSubsetOfEntry {
    my ($self, $key, $value, $columnsAndValues) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{sqlStrings}->{SELECT});
        try {
            my $keyArray = $columnsAndValues->keySet()->toArray();
            my $size = scalar(@{$keyArray});
            $stringBuffer->append($self->{commonSeps}->{SPACE});
            $stringBuffer->append($key);
            for (my $i = 0; $i < $size; $i++) {
                $stringBuffer->append($self->{commonSeps}->{SPACE});
                $stringBuffer->append($keyArray->[$i]->toString());
            }
            $stringBuffer->append($self->{sqlStrings}->{FROM});
            $stringBuffer->append($self->getTableName());
            $stringBuffer->append($self->{sqlStrings}->{WHERE});
            $stringBuffer->append($key);
            $stringBuffer->append($self->{sqlStrings}->{EQUAL_QUOTE});
            $stringBuffer->append($value);
            $stringBuffer->append($self->{sqlStrings}->{CLOSE_QUOTE});
            my $sqlStatement = $stringBuffer->toString();
            my $rset = $self->executeSQLStatement($sqlStatement);
            my $columnName = undef;
            my $field = undef;
            while ($rset->next()) {
                my $keyArray2 = $columnsAndValues->keySet()->toArray();
                my $size2 = scalar(@{$keyArray2});
                for (my $i = 0; $i < $size2; $i++) {
                    $columnName = $keyArray2->[$i]->toString();
                    $field = $rset->getObject($columnName)->toString();
                    if (($field cmp $columnsAndValues->get($columnName)) != 0) {
                        return $org::allbinary::logic::communication::sql::org::allbinary->{globals}->{GLOBALS2}->{NOTASUBSET};
                    }
                }
            }
            if ($rset->getRow() != 1) {
                return $org::allbinary::logic::communication::sql::org::allbinary->{globals}->{GLOBALS2}->{NOTASUBSET};
            } else {
                return $org::allbinary::logic::communication::sql::org::allbinary->{globals}->{GLOBALS2}->{ISASUBSET};
            }
        } catch ($e) {
            my $sqlStatement = $stringBuffer->toString();
            if ($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{FAILED_SQL_STATEMENT} . $sqlStatement, $self, $self->{METHOD_IS_SUBSET_OF_ENTRY}, $e);
            }
            return $self->{FAILED_SQL_STATEMENT} . $sqlStatement;
        }
}

# use java::sql::ResultSet;
use java::util::HashMap;
# use java::util::Set;
use org::allbinary::business::init::db::DbConnectionInfo;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::communication::sql::AbSqlRow;

1;

