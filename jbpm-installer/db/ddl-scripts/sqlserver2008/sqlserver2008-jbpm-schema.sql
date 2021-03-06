
    alter table Attachment 
        drop constraint FK1C93543D937BFB5;

    alter table Attachment 
        drop constraint FK1C9354333CA892A;

    alter table BooleanExpression 
        drop constraint FKE3D208C06C97C90E;

    alter table CorrelationPropertyInfo 
        drop constraint FK761452A5D87156ED;

    alter table Deadline 
        drop constraint FK21DF3E78A9FE0EF4;

    alter table Deadline 
        drop constraint FK21DF3E78695E4DDB;

    alter table Delegation_delegates 
        drop constraint FK47485D5772B3A123;

    alter table Delegation_delegates 
        drop constraint FK47485D57786553A5;

    alter table ErrorInfo 
        drop constraint FK8B1186B6724A467;

    alter table Escalation 
        drop constraint FK67B2C6B5D1E5CC1;

    alter table EventTypes 
        drop constraint FKB0E5621F7665489A;

    alter table I18NText 
        drop constraint FK2349686BF4ACCD69;

    alter table I18NText 
        drop constraint FK2349686B424B187C;

    alter table I18NText 
        drop constraint FK2349686BAB648139;

    alter table I18NText 
        drop constraint FK2349686BB340A2AA;

    alter table I18NText 
        drop constraint FK2349686BF0CDED35;

    alter table I18NText 
        drop constraint FK2349686BCC03ED3C;

    alter table I18NText 
        drop constraint FK2349686B77C1C08A;

    alter table I18NText 
        drop constraint FK2349686B18DDFE05;

    alter table I18NText 
        drop constraint FK2349686B78AF072A;

    alter table Notification 
        drop constraint FK2D45DD0BC0C0F29C;

    alter table Notification_BAs 
        drop constraint FK2DD68EE072B3A123;

    alter table Notification_BAs 
        drop constraint FK2DD68EE093F2090B;

    alter table Notification_Recipients 
        drop constraint FK98FD214E72B3A123;

    alter table Notification_Recipients 
        drop constraint FK98FD214E93F2090B;

    alter table Notification_email_header 
        drop constraint FKF30FE3448BED1339;

    alter table Notification_email_header 
        drop constraint FKF30FE344DD2D7416;

    alter table PeopleAssignments_BAs 
        drop constraint FK9D8CF4EC72B3A123;

    alter table PeopleAssignments_BAs 
        drop constraint FK9D8CF4EC786553A5;

    alter table PeopleAssignments_ExclOwners 
        drop constraint FKC77B97E472B3A123;

    alter table PeopleAssignments_ExclOwners 
        drop constraint FKC77B97E4786553A5;

    alter table PeopleAssignments_PotOwners 
        drop constraint FK1EE418D72B3A123;

    alter table PeopleAssignments_PotOwners 
        drop constraint FK1EE418D786553A5;

    alter table PeopleAssignments_Recipients 
        drop constraint FKC6F615C272B3A123;

    alter table PeopleAssignments_Recipients 
        drop constraint FKC6F615C2786553A5;

    alter table PeopleAssignments_Stakeholders 
        drop constraint FK482F79D572B3A123;

    alter table PeopleAssignments_Stakeholders 
        drop constraint FK482F79D5786553A5;

    alter table Reassignment 
        drop constraint FK724D056062A1E871;

    alter table Reassignment_potentialOwners 
        drop constraint FK90B59CFF72B3A123;

    alter table Reassignment_potentialOwners 
        drop constraint FK90B59CFF35D2FEE0;

    alter table Task 
        drop constraint FK27A9A53C55C806;

    alter table Task 
        drop constraint FK27A9A5B723BE8B;

    alter table Task 
        drop constraint FK27A9A55427E8F1;

    alter table task_comment 
        drop constraint FK61F475A57A3215D9;

    alter table task_comment 
        drop constraint FK61F475A5F510CB46;

    drop table Attachment;

    drop table BAMTaskSummary;

    drop table BooleanExpression;

    drop table Content;

    drop table ContextMappingInfo;

    drop table CorrelationKeyInfo;

    drop table CorrelationPropertyInfo;

    drop table Deadline;

    drop table Delegation_delegates;

    drop table ErrorInfo;

    drop table Escalation;

    drop table EventTypes;

    drop table I18NText;

    drop table NodeInstanceLog;

    drop table Notification;

    drop table Notification_BAs;

    drop table Notification_Recipients;

    drop table Notification_email_header;

    drop table OrganizationalEntity;

    drop table PeopleAssignments_BAs;

    drop table PeopleAssignments_ExclOwners;

    drop table PeopleAssignments_PotOwners;

    drop table PeopleAssignments_Recipients;

    drop table PeopleAssignments_Stakeholders;

    drop table ProcessInstanceInfo;

    drop table ProcessInstanceLog;

    drop table Reassignment;

    drop table Reassignment_potentialOwners;

    drop table RequestInfo;

    drop table SessionInfo;

    drop table Task;

    drop table TaskDef;

    drop table VariableInstanceLog;

    drop table WorkItemInfo;

    drop table email_header;

    drop table task_comment;

    create table Attachment (
        AttachmentId bigint identity not null,
        accessType int,
        attachedAt datetime2,
        attachmentContentId bigint not null,
        contentType varchar(255),
        name varchar(255),
        attachment_size int,
        attachedBy_id varchar(255),
        TaskData_Attachments_Id bigint,
        primary key (AttachmentId)
    );

    create table BAMTaskSummary (
        BAMTaskId bigint identity not null,
        createdDate datetime2,
        duration bigint,
        endDate datetime2,
        processInstanceId bigint not null,
        startDate datetime2,
        status varchar(255),
        taskId bigint not null,
        taskName varchar(255),
        userId varchar(255),
        primary key (BAMTaskId)
    );

    create table BooleanExpression (
        id bigint identity not null,
        expression varchar(MAX),
        type varchar(255),
        Escalation_Constraints_Id bigint,
        primary key (id)
    );

    create table Content (
        id bigint identity not null,
        content varbinary(MAX),
        primary key (id)
    );

    create table ContextMappingInfo (
        mappingId bigint identity not null,
        CONTEXT_ID varchar(255) not null,
        KSESSION_ID int not null,
        OPTLOCK int,
        primary key (mappingId)
    );

    create table CorrelationKeyInfo (
        keyId bigint identity not null,
        name varchar(255),
        processInstanceId bigint not null,
        OPTLOCK int,
        primary key (keyId)
    );

    create table CorrelationPropertyInfo (
        propertyId bigint identity not null,
        name varchar(255),
        value varchar(255),
        OPTLOCK int,
        correlationKey_keyId bigint,
        primary key (propertyId)
    );

    create table Deadline (
        id bigint identity not null,
        deadline_date datetime2,
        escalated smallint,
        Deadlines_StartDeadLine_Id bigint,
        Deadlines_EndDeadLine_Id bigint,
        primary key (id)
    );

    create table Delegation_delegates (
        task_id bigint not null,
        entity_id varchar(255) not null
    );

    create table ErrorInfo (
        id bigint identity not null,
        message varchar(255),
        stacktrace varchar(5000),
        timestamp datetime2,
        REQUEST_ID bigint not null,
        primary key (id)
    );

    create table Escalation (
        id bigint identity not null,
        name varchar(255),
        Deadline_Escalation_Id bigint,
        primary key (id)
    );

    create table EventTypes (
        InstanceId bigint not null,
        eventTypes varchar(255)
    );

    create table I18NText (
        I18NTextId bigint identity not null,
        language varchar(255),
        shortText varchar(255),
        text varchar(MAX),
        Task_Subjects_Id bigint,
        Task_Names_Id bigint,
        Task_Descriptions_Id bigint,
        Reassignment_Documentation_Id bigint,
        Notification_Subjects_Id bigint,
        Notification_Names_Id bigint,
        Notification_Documentation_Id bigint,
        Notification_Descriptions_Id bigint,
        Deadline_Documentation_Id bigint,
        primary key (I18NTextId)
    );

    create table NodeInstanceLog (
        id bigint identity not null,
        connection varchar(255),
        log_date datetime2,
        externalId varchar(255),
        nodeId varchar(255),
        nodeInstanceId varchar(255),
        nodeName varchar(255),
        nodeType varchar(255),
        processId varchar(255),
        processInstanceId bigint not null,
        type int not null,
        workItemId bigint,
        primary key (id)
    );

    create table Notification (
        DTYPE varchar(31) not null,
        NotificationId bigint identity not null,
        priority int not null,
        Escalation_Notifications_Id bigint,
        primary key (NotificationId)
    );

    create table Notification_BAs (
        task_id bigint not null,
        entity_id varchar(255) not null
    );

    create table Notification_Recipients (
        task_id bigint not null,
        entity_id varchar(255) not null
    );

    create table Notification_email_header (
        Notification_NotificationId bigint not null,
        emailHeaders_id bigint not null,
        mapkey varchar(255) not null,
        primary key (Notification_NotificationId, mapkey)
    );

    create table OrganizationalEntity (
        DTYPE varchar(31) not null,
        id varchar(255) not null,
        primary key (id)
    );

    create table PeopleAssignments_BAs (
        task_id bigint not null,
        entity_id varchar(255) not null
    );

    create table PeopleAssignments_ExclOwners (
        task_id bigint not null,
        entity_id varchar(255) not null
    );

    create table PeopleAssignments_PotOwners (
        task_id bigint not null,
        entity_id varchar(255) not null
    );

    create table PeopleAssignments_Recipients (
        task_id bigint not null,
        entity_id varchar(255) not null
    );

    create table PeopleAssignments_Stakeholders (
        task_id bigint not null,
        entity_id varchar(255) not null
    );

    create table ProcessInstanceInfo (
        InstanceId bigint identity not null,
        lastModificationDate datetime2,
        lastReadDate datetime2,
        processId varchar(255),
        processInstanceByteArray varbinary(MAX),
        startDate datetime2,
        state int not null,
        OPTLOCK int,
        primary key (InstanceId)
    );

    create table ProcessInstanceLog (
        id bigint identity not null,
        duration bigint,
        end_date datetime2,
        externalId varchar(255),
        user_identity varchar(255),
        outcome varchar(255),
        parentProcessInstanceId bigint,
        processId varchar(255),
        processInstanceId bigint not null,
        processName varchar(255),
        processVersion varchar(255),
        start_date datetime2,
        status int,
        primary key (id)
    );

    create table Reassignment (
        id bigint identity not null,
        Escalation_Reassignments_Id bigint,
        primary key (id)
    );

    create table Reassignment_potentialOwners (
        task_id bigint not null,
        entity_id varchar(255) not null
    );

    create table RequestInfo (
        id bigint identity not null,
        commandName varchar(255),
        deploymentId varchar(255),
        executions int not null,
        businessKey varchar(255),
        message varchar(255),
        requestData varbinary(MAX),
        responseData varbinary(MAX),
        retries int not null,
        status varchar(255),
        timestamp datetime2,
        primary key (id)
    );

    create table SessionInfo (
        id int identity not null,
        lastModificationDate datetime2,
        rulesByteArray varbinary(MAX),
        startDate datetime2,
        OPTLOCK int,
        primary key (id)
    );

    create table Task (
        TaskId bigint identity not null,
        archived smallint,
        allowedToDelegate varchar(255),
        formName varchar(255),
        priority int not null,
        subTaskStrategy varchar(255),
        activationTime datetime2,
        createdOn datetime2,
        deploymentId varchar(255),
        documentAccessType int,
        documentContentId bigint not null,
        documentType varchar(255),
        expirationTime datetime2,
        faultAccessType int,
        faultContentId bigint not null,
        faultName varchar(255),
        faultType varchar(255),
        outputAccessType int,
        outputContentId bigint not null,
        outputType varchar(255),
        parentId bigint not null,
        previousStatus int,
        processId varchar(255),
        processInstanceId bigint not null,
        processSessionId int not null,
        skipable bit not null,
        status varchar(255),
        workItemId bigint not null,
        taskType varchar(255),
        OPTLOCK int,
        taskInitiator_id varchar(255),
        actualOwner_id varchar(255),
        createdBy_id varchar(255),
        primary key (TaskId)
    );

    create table TaskDef (
        TaskDefId bigint identity not null,
        name varchar(255),
        priority int not null,
        primary key (TaskDefId)
    );

    create table VariableInstanceLog (
        id bigint identity not null,
        log_date datetime2,
        externalId varchar(255),
        oldValue varchar(255),
        processId varchar(255),
        processInstanceId bigint not null,
        value varchar(255),
        variableId varchar(255),
        variableInstanceId varchar(255),
        primary key (id)
    );

    create table WorkItemInfo (
        workItemId bigint identity not null,
        creationDate datetime2,
        name varchar(255),
        processInstanceId bigint not null,
        state bigint not null,
        OPTLOCK int,
        workItemByteArray varbinary(MAX),
        primary key (workItemId)
    );

    create table email_header (
        id bigint identity not null,
        body varchar(MAX),
        fromAddress varchar(255),
        language varchar(255),
        replyToAddress varchar(255),
        subject varchar(255),
        primary key (id)
    );

    create table task_comment (
        id bigint identity not null,
        addedAt datetime2,
        text varchar(MAX),
        addedBy_id varchar(255),
        TaskData_Comments_Id bigint,
        primary key (id)
    );

    alter table Attachment 
        add constraint FK1C93543D937BFB5 
        foreign key (attachedBy_id) 
        references OrganizationalEntity;

    alter table Attachment 
        add constraint FK1C9354333CA892A 
        foreign key (TaskData_Attachments_Id) 
        references Task;

    alter table BooleanExpression 
        add constraint FKE3D208C06C97C90E 
        foreign key (Escalation_Constraints_Id) 
        references Escalation;

    alter table CorrelationPropertyInfo 
        add constraint FK761452A5D87156ED 
        foreign key (correlationKey_keyId) 
        references CorrelationKeyInfo;

    alter table Deadline 
        add constraint FK21DF3E78A9FE0EF4 
        foreign key (Deadlines_StartDeadLine_Id) 
        references Task;

    alter table Deadline 
        add constraint FK21DF3E78695E4DDB 
        foreign key (Deadlines_EndDeadLine_Id) 
        references Task;

    alter table Delegation_delegates 
        add constraint FK47485D5772B3A123 
        foreign key (entity_id) 
        references OrganizationalEntity;

    alter table Delegation_delegates 
        add constraint FK47485D57786553A5 
        foreign key (task_id) 
        references Task;

    alter table ErrorInfo 
        add constraint FK8B1186B6724A467 
        foreign key (REQUEST_ID) 
        references RequestInfo;

    alter table Escalation 
        add constraint FK67B2C6B5D1E5CC1 
        foreign key (Deadline_Escalation_Id) 
        references Deadline;

    alter table EventTypes 
        add constraint FKB0E5621F7665489A 
        foreign key (InstanceId) 
        references ProcessInstanceInfo;

    alter table I18NText 
        add constraint FK2349686BF4ACCD69 
        foreign key (Task_Subjects_Id) 
        references Task;

    alter table I18NText 
        add constraint FK2349686B424B187C 
        foreign key (Task_Names_Id) 
        references Task;

    alter table I18NText 
        add constraint FK2349686BAB648139 
        foreign key (Task_Descriptions_Id) 
        references Task;

    alter table I18NText 
        add constraint FK2349686BB340A2AA 
        foreign key (Reassignment_Documentation_Id) 
        references Reassignment;

    alter table I18NText 
        add constraint FK2349686BF0CDED35 
        foreign key (Notification_Subjects_Id) 
        references Notification;

    alter table I18NText 
        add constraint FK2349686BCC03ED3C 
        foreign key (Notification_Names_Id) 
        references Notification;

    alter table I18NText 
        add constraint FK2349686B77C1C08A 
        foreign key (Notification_Documentation_Id) 
        references Notification;

    alter table I18NText 
        add constraint FK2349686B18DDFE05 
        foreign key (Notification_Descriptions_Id) 
        references Notification;

    alter table I18NText 
        add constraint FK2349686B78AF072A 
        foreign key (Deadline_Documentation_Id) 
        references Deadline;

    alter table Notification 
        add constraint FK2D45DD0BC0C0F29C 
        foreign key (Escalation_Notifications_Id) 
        references Escalation;

    alter table Notification_BAs 
        add constraint FK2DD68EE072B3A123 
        foreign key (entity_id) 
        references OrganizationalEntity;

    alter table Notification_BAs 
        add constraint FK2DD68EE093F2090B 
        foreign key (task_id) 
        references Notification;

    alter table Notification_Recipients 
        add constraint FK98FD214E72B3A123 
        foreign key (entity_id) 
        references OrganizationalEntity;

    alter table Notification_Recipients 
        add constraint FK98FD214E93F2090B 
        foreign key (task_id) 
        references Notification;

    alter table Notification_email_header 
        add constraint UK_F30FE3446CEA0510 unique (emailHeaders_id);

    alter table Notification_email_header 
        add constraint FKF30FE3448BED1339 
        foreign key (emailHeaders_id) 
        references email_header;

    alter table Notification_email_header 
        add constraint FKF30FE344DD2D7416 
        foreign key (Notification_NotificationId) 
        references Notification;

    alter table PeopleAssignments_BAs 
        add constraint FK9D8CF4EC72B3A123 
        foreign key (entity_id) 
        references OrganizationalEntity;

    alter table PeopleAssignments_BAs 
        add constraint FK9D8CF4EC786553A5 
        foreign key (task_id) 
        references Task;

    alter table PeopleAssignments_ExclOwners 
        add constraint FKC77B97E472B3A123 
        foreign key (entity_id) 
        references OrganizationalEntity;

    alter table PeopleAssignments_ExclOwners 
        add constraint FKC77B97E4786553A5 
        foreign key (task_id) 
        references Task;

    alter table PeopleAssignments_PotOwners 
        add constraint FK1EE418D72B3A123 
        foreign key (entity_id) 
        references OrganizationalEntity;

    alter table PeopleAssignments_PotOwners 
        add constraint FK1EE418D786553A5 
        foreign key (task_id) 
        references Task;

    alter table PeopleAssignments_Recipients 
        add constraint FKC6F615C272B3A123 
        foreign key (entity_id) 
        references OrganizationalEntity;

    alter table PeopleAssignments_Recipients 
        add constraint FKC6F615C2786553A5 
        foreign key (task_id) 
        references Task;

    alter table PeopleAssignments_Stakeholders 
        add constraint FK482F79D572B3A123 
        foreign key (entity_id) 
        references OrganizationalEntity;

    alter table PeopleAssignments_Stakeholders 
        add constraint FK482F79D5786553A5 
        foreign key (task_id) 
        references Task;

    alter table Reassignment 
        add constraint FK724D056062A1E871 
        foreign key (Escalation_Reassignments_Id) 
        references Escalation;

    alter table Reassignment_potentialOwners 
        add constraint FK90B59CFF72B3A123 
        foreign key (entity_id) 
        references OrganizationalEntity;

    alter table Reassignment_potentialOwners 
        add constraint FK90B59CFF35D2FEE0 
        foreign key (task_id) 
        references Reassignment;

    alter table Task 
        add constraint FK27A9A53C55C806 
        foreign key (taskInitiator_id) 
        references OrganizationalEntity;

    alter table Task 
        add constraint FK27A9A5B723BE8B 
        foreign key (actualOwner_id) 
        references OrganizationalEntity;

    alter table Task 
        add constraint FK27A9A55427E8F1 
        foreign key (createdBy_id) 
        references OrganizationalEntity;

    alter table task_comment 
        add constraint FK61F475A57A3215D9 
        foreign key (addedBy_id) 
        references OrganizationalEntity;

    alter table task_comment 
        add constraint FK61F475A5F510CB46 
        foreign key (TaskData_Comments_Id) 
        references Task;
