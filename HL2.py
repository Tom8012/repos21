import pandas as pd
import matplotlib.pyplot as plt

# Loan details
loan_amount = 1_300_000
interest_rate = 10.75 / 100  # annual interest rate
monthly_interest = interest_rate / 12
loan_term_months = 20 * 12  # 20 years
extra_payment = 1000  # extra monthly payment

# Function to generate amortization schedule
def amortization_schedule(principal, monthly_rate, months, extra=0):
    schedule = []
    balance = principal
    month = 1

    monthly_payment = principal * (monthly_rate * (1 + monthly_rate)**months) / ((1 + monthly_rate)**months - 1)

    while balance > 0 and month <= months + 100:
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

# Create the schedule
schedule_df = amortization_schedule(loan_amount, monthly_interest, loan_term_months, extra=extra_payment)

# Plotting the loan balance over time
plt.figure(figsize=(10, 6))
plt.plot(schedule_df['Month'], schedule_df['Balance'], color='blue', linewidth=2)
plt.title('Loan Balance Over Time with R1,000 Extra Payment', fontsize=14)
plt.xlabel('Month')
plt.ylabel('Remaining Balance (R)')
plt.grid(True)
plt.tight_layout()
plt.show()