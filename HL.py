import pandas as pd

# Loan details
loan_amount = 1300000
interest_rate = 10.75 / 100  # annual interest rate
monthly_interest = interest_rate / 12
loan_term_months = 20 * 12  # 20 years
extra_payment = 0  # extra monthly payment

# Function to generate amortization schedule
def amortization_schedule(principal, monthly_rate, months, extra=0):
    schedule = []
    balance = principal
    month = 1

    monthly_payment = principal * (monthly_rate * (1 + monthly_rate)**months) / ((1 + monthly_rate)**months - 1)

    while balance > 0 and month <= months + 100:  # buffer for early payoff
        interest = balance * monthly_rate
        principal_payment = monthly_payment + extra - interest
        if principal_payment > balance:
            principal_payment = balance
            monthly_payment = interest + balance - extra
        balance -= principal_payment
        schedule.append([month, round(monthly_payment + extra, 2), round(interest, 2), round(principal_payment, 2), round(balance, 2)])
        month += 1

    columns = ['Month', 'Payment', 'Interest', 'Principal', 'Balance']
    return pd.DataFrame(schedule, columns=columns)

# Generate and view the schedule
df_schedule = amortization_schedule(loan_amount, monthly_interest, loan_term_months,
                                     extra=extra_payment)
print(df_schedule.head(12))  # Print the first year of payments