# Основные агрегаты доменной модели

В архитектуре Future 2.0 используется подход Domain Driven Design (DDD).  
Каждый домен содержит агрегаты, которые инкапсулируют бизнес-логику и поддерживают консистентность данных.

---

## Customer Domain

### Aggregate: Customer

Описание:  
Представляет клиента компании, который может пользоваться медицинскими и финансовыми сервисами.

Границы агрегата:
- персональные данные
- контактная информация
- согласие на обработку данных

Инварианты:
- email и телефон должны быть уникальны
- согласие на обработку данных должно быть подтверждено

Ключ:
- customerId (UUID)


События:
- CustomerRegistered
- CustomerUpdated

---

## Medical Domain

### Aggregate: Patient

Описание:  
Пациент, связанный с клиентом системы.

Инварианты:
- пациент должен иметь связанный Customer

События:
- PatientCreated

---

### Aggregate: Appointment

Описание:
Медицинский приём пациента.

Инварианты:
- врач не может иметь два приёма в одно время

События:
- AppointmentScheduled
- AppointmentCompleted
- AppointmentCancelled

---

### Aggregate: Diagnosis

Описание:
Медицинский диагноз пациента.

Инварианты:
- диагноз фиксируется только после завершения приёма

События:
- DiagnosisRecorded

---

### Aggregate: ImagingStudy

Описание:
Диагностическое исследование (МРТ, КТ, рентген).

События:
- ImagingStudyRequested
- ImagingStudyCompleted

---

## AI Diagnostics Domain

### Aggregate: AIAnalysis

Описание:
Результат анализа медицинских данных алгоритмами искусственного интеллекта.

Инварианты:
- результат должен содержать метрику confidence

События:
- AIAnalysisRequested
- AIAnalysisCompleted

---

## Fintech Domain

### Aggregate: Account

Описание:
Банковский счёт клиента.

Инварианты:
- баланс не может быть отрицательным (кроме кредитных счетов)

События:
- AccountOpened
- BalanceChanged

---

### Aggregate: Loan

Описание:
Кредитный договор клиента.

Инварианты:
- сумма кредита не должна превышать лимит клиента

События:
- LoanApplicationSubmitted
- LoanApproved
- LoanDisbursed
- LoanRepaid

---

## Billing Domain

### Aggregate: Invoice

Описание:
Счёт за медицинские услуги.

Инварианты:
- сумма счёта должна соответствовать оказанным услугам

События:
- InvoiceCreated
- InvoicePaid

---

## Inventory Domain

### Aggregate: InventoryItem

Описание:
Медицинский расходный материал.

Инварианты:
- количество не может быть отрицательным

События:
- InventoryItemUsed
- InventoryLow

---

## Staff Domain

### Aggregate: StaffMember

Описание:
Сотрудник медицинского учреждения.

Инварианты:
- сотрудник может иметь только одну основную должность

События:
- StaffAssigned
- StaffLeft