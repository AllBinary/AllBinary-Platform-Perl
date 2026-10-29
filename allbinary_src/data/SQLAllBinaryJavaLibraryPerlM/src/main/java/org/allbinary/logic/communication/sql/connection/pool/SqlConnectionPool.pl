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

package org::allbinary::logic::communication::sql::connection::pool::SqlConnectionPool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::sql::connection::pool::SqlConnectionPool'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{stdUtil} = 'org::allbinary::logic::StdUtil'->getInstance();
    $self->{connectionHashMap} = undef;
    $self->{FIRST_NEW_CONNECTION_CREATED} = "First New Connection Created: ";
    $self->{FIRST} = "First ";
    $self->{NEW_CONNECTION_FOR} = "New Connection For ";
    $self->{CREATED} = " Created";
    $self->{NUMBER_OF_SQL_CONNECTIONS_FOR} = "Number Of Sql Connections for: ";
    $self->{NUMBER_OF_SQL_CONNECTION_VECTORS} = "Number Of Sql Connection Vectors: ";
    $self->{IS} = " is ";
    $self->{CONNECTION_ALLREADY_CLOSED} = "Connection AllReady Closed";
    $self->{METHOD_GET} = "get()";
    $self->{METHOD_ADD} = "add()";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::sql::connection::pool::SqlConnectionPool::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws SQLException
sub get {
    my ($self, $url) = @_;
        if (!defined($self->{connectionHashMap})) {
            $self->{connectionHashMap} = $self->{stdUtil}->createHashMap();
            if ($org::allbinary::logic::communication::sql::connection::pool::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::connection::pool::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGPOOL})) {
                $self->{logUtil}->putF($self->{FIRST_NEW_CONNECTION_CREATED} . $url, $self, $self->{METHOD_GET});
            }
            return 'java::sql::DriverManager'->getConnection($url);
        } else {
            my $connectionVector = $self->{connectionHashMap}->get($url);
            if (!defined($connectionVector)) {
                $connectionVector = 'org::allbinary::util::BasicArrayListD'->new();
                if ($org::allbinary::logic::communication::sql::connection::pool::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::connection::pool::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGPOOL})) {
                    my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                    $stringBuffer->append($self->{FIRST});
                    $stringBuffer->append($self->{NEW_CONNECTION_FOR});
                    $stringBuffer->append($url);
                    $stringBuffer->append($self->{CREATED});
                    $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{METHOD_GET});
                }
                return 'java::sql::DriverManager'->getConnection($url);
            } elsif ($connectionVector->size() == 0) {
                if ($org::allbinary::logic::communication::sql::connection::pool::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::connection::pool::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGPOOL})) {
                    $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append($self->{NEW_CONNECTION_FOR})->append($url)->append($self->{CREATED})->toString(), $self, $self->{METHOD_GET});
                }
                return 'java::sql::DriverManager'->getConnection($url);
            } else {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                my $size = $connectionVector->size();
                for (my $i = 0; $i < $size; $i++) {
                    my $sqlConnection = $connectionVector->get($i);
                    if (!$sqlConnection->isClosed()) {
                        $connectionVector->remove($sqlConnection);
                        $self->{connectionHashMap}->put($url, $connectionVector);
                        if ($org::allbinary::logic::communication::sql::connection::pool::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::connection::pool::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGPOOL})) {
                            $stringBuffer->delete(0, $stringBuffer->length());
                            $stringBuffer->append($self->{NUMBER_OF_SQL_CONNECTIONS_FOR});
                            $stringBuffer->append($url);
                            $stringBuffer->append($self->{IS});
                            $stringBuffer->appendint($connectionVector->size());
                            $self->{logUtil}->putF($self->{NUMBER_OF_SQL_CONNECTION_VECTORS} . $self->{connectionHashMap}->size(), $self, $self->{METHOD_GET});
                            $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{METHOD_GET});
                        }
                        return $sqlConnection;
                    }
                }
            }
        }
        if ($org::allbinary::logic::communication::sql::connection::pool::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::connection::pool::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGPOOL})) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append($self->{NEW_CONNECTION_FOR});
            $stringBuffer->append($url);
            $stringBuffer->append($self->{CREATED});
            $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{METHOD_GET});
        }
        return 'java::sql::DriverManager'->getConnection($url);
}


# throws SQLException
sub add {
    my ($self, $url, $sqlConnection) = @_;
        if (!$sqlConnection->isClosed()) {
            my $connectionVector = undef;
            if (!defined($self->{connectionHashMap})) {
                $self->{connectionHashMap} = $self->{stdUtil}->createHashMap();
                $connectionVector = 'org::allbinary::util::BasicArrayListD'->new();
                $connectionVector->add($sqlConnection);
            } else {
                $connectionVector = $self->{connectionHashMap}->get($url);
                if (!defined($connectionVector)) {
                    $connectionVector = 'org::allbinary::util::BasicArrayListD'->new();
                }
                $connectionVector->add($sqlConnection);
                $self->{connectionHashMap}->put($url, $connectionVector);
            }
            if ($org::allbinary::logic::communication::sql::connection::pool::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::connection::pool::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGPOOL})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append($self->{NUMBER_OF_SQL_CONNECTIONS_FOR});
                $stringBuffer->append($url);
                $stringBuffer->append($self->{IS});
                $stringBuffer->appendint($connectionVector->size());
                $self->{logUtil}->putF($self->{NUMBER_OF_SQL_CONNECTION_VECTORS} . $self->{connectionHashMap}->size(), $self, $self->{METHOD_ADD});
                $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{METHOD_ADD});
            }
        }
        if ($org::allbinary::logic::communication::sql::connection::pool::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::sql::connection::pool::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGPOOL})) {
            $self->{logUtil}->putF($self->{CONNECTION_ALLREADY_CLOSED}, $self, $self->{METHOD_ADD});
        }
}

# use java::sql::Connection;
# use java::sql::DriverManager;
# use java::sql::SQLException;
use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;

1;

